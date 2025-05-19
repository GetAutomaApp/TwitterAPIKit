// TwitterAPISessionDataTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public protocol TwitterAPISessionDataTask: TwitterAPISessionTask {
    @discardableResult
    func responseData(
        queue: DispatchQueue,
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self

    @discardableResult
    func responseData(
        _ block: @escaping (TwitterAPIResponse<Data>) -> Void
    ) -> Self
}

// MARK: - internal

extension TwitterAPISessionDataTask {
    /// Specializes the task to return a new type.
    /// - Parameters:
    ///   - transform: The transform to apply to the data.
    /// - Returns: A new specialized task.
    public func specialized<NewSuccess>(
        _ transform: @escaping (Data) throws -> NewSuccess
    )
        -> TwitterAPISessionSpecializedTask<NewSuccess>
    {
        return TwitterAPISessionSpecializedTask(task: self, transform: transform)
    }
}
