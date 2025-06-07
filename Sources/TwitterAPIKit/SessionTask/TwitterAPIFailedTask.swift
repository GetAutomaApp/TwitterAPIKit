// TwitterAPIFailedTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct TwitterAPIFailedTask: TwitterAPISessionJSONTask, TwitterAPISessionStreamTask {
    public let error: TwitterAPIKitError

    public init(_ error: TwitterAPIKitError) {
        self.error = error
    }

    public let taskIdentifier: Int = -1
    public let currentRequest: URLRequest? = nil
    public let originalRequest: URLRequest? = nil
    public let httpResponse: HTTPURLResponse? = nil

    public func responseData(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        queue.async {
            block(
                TwitterAPIResponse<Data>(
                    request: nil,
                    response: nil,
                    data: nil,
                    result: .failure(error),
                    rateLimit: nil
                )
            )
        }
        return self
    }

    @discardableResult
    public func responseData(
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        responseData(queue: .main, block)
    }

    @discardableResult
    public func responseObject(
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        queue.async {
            block(
                TwitterAPIResponse<Data>(
                    request: nil,
                    response: nil,
                    data: nil,
                    result: .failure(error),
                    rateLimit: nil
                )
            )
        }
        return self
    }

    @discardableResult
    public func responseObject(
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        responseObject(queue: .main, block)
    }

    @discardableResult
    public func responseDecodable<T>(
        type _: T.Type,
        decoder _: JSONDecoder,
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self where T: Decodable {
        queue.async {
            block(
                TwitterAPIResponse<T>(
                    request: nil,
                    response: nil,
                    data: nil,
                    result: .failure(error),
                    rateLimit: nil
                )
            )
        }
        return self
    }

    @discardableResult
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

    @discardableResult
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

    @discardableResult
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

    @discardableResult
    public func streamResponse(
        queue: DispatchQueue,
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        queue.async {
            let response = TwitterAPIResponse<Data>(
                request: nil,
                response: nil,
                data: nil,
                result: .failure(error),
                rateLimit: nil
            )
            block(response)
        }
        return self
    }

    @discardableResult
    public func streamResponse(
        _ block: @Sendable @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self {
        streamResponse(queue: .main, block)
    }

    public func cancel() {}
}
