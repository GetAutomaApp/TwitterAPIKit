// TwitterAPISessionTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// A protocol that defines the properties and methods for a session task.
public protocol TwitterAPISessionTask: Sendable {
    /// The unique identifier for the task.
    var taskIdentifier: Int { get }
    /// The current request being processed.
    var currentRequest: URLRequest? { get }
    /// The original request that was used to create the task.
    var originalRequest: URLRequest? { get }
    /// The HTTP response received from the server.
    var httpResponse: HTTPURLResponse? { get }
    /// Cancels the task.
    func cancel()
}

/// A default implementation of the TwitterAPISessionTask protocol.
extension URLSessionTask: TwitterAPISessionTask {
    /// The HTTP response received from the server.
    public var httpResponse: HTTPURLResponse? {
        response as? HTTPURLResponse
    }
}
