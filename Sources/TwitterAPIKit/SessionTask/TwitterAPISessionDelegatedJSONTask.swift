// TwitterAPISessionDelegatedJSONTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

internal protocol TwitterAPISessionDelegatedJSONTaskDelegate: AnyObject, Sendable {
    func didFinishQueueInJsonTask(task: TwitterAPISessionDelegatedJSONTask)
}

public struct TwitterAPISessionDelegatedJSONTask: TwitterAPISessionJSONTask, TwitterAPISessionDelegatedTask {
    public var taskIdentifier: Int {
        task.taskIdentifier
    }

    public var currentRequest: URLRequest? {
        task.currentRequest
    }

    public var originalRequest: URLRequest? {
        task.originalRequest
    }

    public var httpResponse: HTTPURLResponse? {
        task.httpResponse
    }

    internal weak var delegate: TwitterAPISessionDelegatedJSONTaskDelegate?

    public private(set) var error: Error?
    public var data: Data? {
        guard completed else { return nil }
        return dataChunk
    }

    public private(set) var completed = false

    internal let task: TwitterAPISessionTask

    private let taskQueue: DispatchQueue
    private var dataChunk: Data = .init()
    private let group = DispatchGroup()

    public init(task: TwitterAPISessionTask) {
        self.task = task

        // Serial queue
        taskQueue = DispatchQueue(label: "TwitterAPIClient.task.\(task.taskIdentifier)")
        taskQueue.suspend()
    }

    public mutating func append(chunk: Data) {
        dataChunk.append(chunk)
    }

    public mutating func complete(error: Error?) {
        self.error = error
        completed = true

        group.notify(queue: taskQueue) { [self] in
            delegate?.didFinishQueueInJsonTask(task: self)
        }
        taskQueue.resume()
    }

    // swiftlint:disable:next function_body_length
    private func getResponse() -> TwitterAPIResponse<Data> {
        guard completed, let data else {
            fatalError("Request not completed yet.")
        }

        guard error == nil, let httpResponse else {
            return TwitterAPIResponse(
                request: currentRequest,
                response: httpResponse,
                data: data,
                result: .failure(.responseFailed(reason: .invalidResponse(error: error))),
                rateLimit: nil
            )
        }

        let rateLimit = TwitterRateLimit(header: httpResponse.allHeaderFields)

        guard 200 ..< 300 ~= httpResponse.statusCode else {
            return TwitterAPIResponse(
                request: currentRequest,
                response: httpResponse,
                data: data,
                result: .failure(
                    .responseFailed(
                        reason: .unacceptableStatusCode(
                            statusCode: httpResponse.statusCode, error: .init(data: data), rateLimit: rateLimit
                        )
                    )
                ),
                rateLimit: rateLimit
            )
        }

        return TwitterAPIResponse(
            request: currentRequest,
            response: httpResponse,
            data: data,
            result: .success(data),
            rateLimit: rateLimit
        )
    }

    private func registerResponseBlock<T>(
        queue: DispatchQueue,
        flatMap transform: @escaping (Data) -> Result<T, TwitterAPIKitError>,
        response block: @escaping ((TwitterAPIResponse<T>) -> Void)
    ) -> Self {
        group.enter()
        taskQueue.async { [self] in

            let response = getResponse().flatMap(transform)

            queue.async { [self] in
                block(response)
                group.leave()
            }
        }

        return self
    }

    public func responseData(queue: DispatchQueue, _ block: @escaping (TwitterAPIResponse<Data>) -> Void) -> Self {
        registerResponseBlock(queue: queue, flatMap: { .success($0) }, response: block)
    }

    @discardableResult
    public func responseData(_ block: @escaping (TwitterAPIResponse<Data>) -> Void) -> Self {
        responseData(queue: .main, block)
    }

    public func responseObject(
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        registerResponseBlock(
            queue: queue,
            flatMap: { $0.serialize() } ,
            response: block
        )
    }

    public func responseObject(_ block: @escaping (TwitterAPIResponse<Data>) -> Void) -> Self {
        responseObject(queue: .main, block)
    }

    public func responseDecodable<T>(
        type: T.Type,
        decoder: JSONDecoder = TwitterAPIClient.defaultJSONDecoder,
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self where T: Decodable {
        registerResponseBlock(
            queue: queue,
            flatMap: { $0.decode(type, decoder: decoder) },
            response: block
        )
    }

    public func responseDecodable<T>(
        type: T.Type,
        decoder: JSONDecoder,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self where T: Decodable {
        responseDecodable(
            type: type,
            decoder: decoder,
            queue: .main,
            block
        )
    }

    public func responseDecodable<T>(
        type: T.Type,
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self where T: Decodable {
        responseDecodable(
            type: type,
            decoder: TwitterAPIClient.defaultJSONDecoder,
            queue: queue,
            block
        )
    }

    public func responseDecodable<T>(
        type: T.Type,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self where T: Decodable {
        responseDecodable(
            type: type,
            decoder: TwitterAPIClient.defaultJSONDecoder,
            queue: .main,
            block
        )
    }

    public func cancel() {
        task.cancel()
    }
}
