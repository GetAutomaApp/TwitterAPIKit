// TwitterAPISessionJSONTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public protocol TwitterAPISessionJSONTask: TwitterAPISessionDataTask {
    @discardableResult
    func responseObject(
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self

    @discardableResult
    func responseObject(
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        decoder: JSONDecoder,
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        decoder: JSONDecoder,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self

    @discardableResult
    func responseDecodable<T: Decodable>(
        type: T.Type,
        _ block: @escaping (TwitterAPIResponse<T>) -> Void
    ) -> Self
}
