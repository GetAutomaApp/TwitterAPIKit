// TwitterAPISessionSpecializedTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public protocol TwitterAPISessionSpecializedTaskProtocol: TwitterAPISessionDataTask {
    associatedtype Success
    @discardableResult
    func responseObject(
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<Success>) -> Void
    ) -> TwitterAPISessionSpecializedTask<Success>
}

public struct TwitterAPISessionSpecializedTask<Success>: TwitterAPISessionSpecializedTaskProtocol {
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
    private let transform: (Data) throws -> Success

    public init(
        task: TwitterAPISessionDataTask,
        transform: @escaping (Data) throws -> Success
    ) {
        innerTask = task
        self.transform = transform
    }

    @discardableResult
    public func responseObject(
        queue: DispatchQueue = .main,
        _ block: @escaping (TwitterAPIResponse<Success>) -> Void
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
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> TwitterAPISessionSpecializedTask<Success> {
        innerTask.responseData(queue: queue, block)
        return self
    }

    @discardableResult
    public func responseData(
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
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
        _ block: @escaping ([TwitterAPIResponse<Element.Success>]) -> Void
    ) {
        let group = DispatchGroup()

        var responses = [TwitterAPIResponse<Element.Success>]()
        let innerQueue = DispatchQueue(label: "TwitterAPISessionSpecializedTask.array")
        innerQueue.suspend()

        for task in self {
            group.enter()
            innerQueue.async {
                task.responseObject(queue: innerQueue) {
                    responses.append($0)
                    group.leave()
                }
            }
        }

        group.notify(queue: queue) {
            block(responses)
        }

        innerQueue.resume()
    }
}
