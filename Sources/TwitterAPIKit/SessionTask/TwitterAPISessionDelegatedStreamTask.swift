// TwitterAPISessionDelegatedStreamTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

private let chunkSeparator = Data("\r\n".utf8)
public struct TwitterAPISessionDelegatedStreamTask: TwitterAPISessionStreamTask, TwitterAPISessionDelegatedTask {
    public var taskIdentifier: Int { task.taskIdentifier }
    public var currentRequest: URLRequest? { task.currentRequest }
    public var originalRequest: URLRequest? { task.originalRequest }
    public var httpResponse: HTTPURLResponse? {
        task.httpResponse
    }

    private let task: TwitterAPISessionTask
    private var dataBlocks = [(queue: DispatchQueue, block: @Sendable (TwitterAPIResponse<Data>) -> Void)]()
    private lazy var taskQueue = DispatchQueue(label: "TwitterAPISessionDelegatedStreamTask_\(taskIdentifier)")

    public init(task: TwitterAPISessionTask) {
        self.task = task
    }

    @discardableResult
    public mutating func streamResponse(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        dataBlocks.append((queue: queue, block: block))
        return self
    }

    @discardableResult
    public mutating func streamResponse(
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        dataBlocks.append((queue: .main, block: block))
        return self
    }

    public func cancel() {
        task.cancel()
    }

    public mutating func append(chunk: Data) {
        taskQueue.async { [self] in
            guard let httpResponse else {
                notify(result: .failure(.responseFailed(reason: .invalidResponse(error: nil))), rateLimit: nil)
                return
            }

            let rateLimit = TwitterRateLimit(header: httpResponse.allHeaderFields)

            guard httpResponse.statusCode < 300 else {
                let error = TwitterAPIErrorResponse(data: chunk)
                notify(
                    result: .failure(
                        .responseFailed(
                            reason: .unacceptableStatusCode(
                                statusCode: httpResponse.statusCode,
                                error: error,
                                rateLimit: rateLimit
                            )
                        )
                    ), rateLimit: rateLimit
                )

                return
            }

            for data in chunk.split(separator: chunkSeparator) {
                notify(result: .success(data), rateLimit: rateLimit)
            }
        }
    }

    public mutating func complete(error: Error?) {
        if let error {
            taskQueue.async { [self] in
                notify(result: .failure(.responseFailed(reason: .invalidResponse(error: error))), rateLimit: nil)
            }
        }
    }

    private func notify(result: Result<Data, TwitterAPIKitError>, rateLimit: TwitterRateLimit?) {
        let response = TwitterAPIResponse(
            request: currentRequest,
            response: httpResponse,
            data: result.success,
            result: result,
            rateLimit: rateLimit
        )

        for (queue, block) in dataBlocks {
            queue.async {
                block(response)
            }
        }
    }

}
