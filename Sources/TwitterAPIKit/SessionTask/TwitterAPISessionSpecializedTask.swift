// TwitterAPISessionSpecializedTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public protocol TwitterAPISessionSpecializedTaskProtocol: TwitterAPISessionDataTask {
    associatedtype Success: Sendable
    @discardableResult
    func responseObject(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Success>) -> Void
    ) -> TwitterAPISessionSpecializedTask<Success>
}

public struct TwitterAPISessionSpecializedTask<Success: Sendable>: TwitterAPISessionSpecializedTaskProtocol {
    public var taskIdentifier: Int {
        innerTask.taskIdentifier
    }

    public var currentRequest: URLRequest? {
        innerTask.currentRequest
    }

    public var originalRequest: URLRequest? {
        innerTask.originalRequest
    }

    public var httpResponse: HTTPURLResponse? {
        innerTask.httpResponse
    }

    private let innerTask: TwitterAPISessionDataTask
    private let transform: @Sendable (Data) throws -> Success

    public init(
        task: TwitterAPISessionDataTask,
        transform: @Sendable @escaping (Data) throws -> Success
    ) {
        innerTask = task
        self.transform = transform
    }

    @discardableResult
    public func responseObject(
        queue: DispatchQueue = .main,
        _ block: @Sendable @escaping (TwitterAPIResponse<Success>) -> Void
    ) -> TwitterAPISessionSpecializedTask<Success> {
        innerTask.responseData(queue: queue) { response in
            let success = response.tryMap(transform)
            block(success)
        }
        return self
    }

    @discardableResult
    public func responseData(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> TwitterAPISessionSpecializedTask<Success> {
        innerTask.responseData(queue: queue, block)
        return self
    }

    @discardableResult
    public func responseData(
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> TwitterAPISessionSpecializedTask<
        Success
    > {
        responseData(queue: .main, block)
    }

    public func cancel() {
        innerTask.cancel()
    }
}

public extension Array where Element: TwitterAPISessionSpecializedTaskProtocol {
    /// Specializes the task to return an array of responses.
    /// - Parameters:
    ///   - queue: The queue to run the response on.
    ///   - block: The block to call with the responses.
    func responseObject(
        queue: DispatchQueue = .main,
        _ block: @escaping @Sendable ([TwitterAPIResponse<Element.Success>]) -> Void
    ) async {
        var responses: [TwitterAPIResponse<Element.Success>] = []
        
        for task in self {
            let response = await withCheckedContinuation { continuation in
                task.responseObject(queue: .main) { response in
                    continuation.resume(returning: response)
                }
            }
            responses.append(response)
        }
        
        await MainActor.run {
            block(responses)
        }
    }
}
