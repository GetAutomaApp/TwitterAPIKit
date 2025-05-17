// TwitterAPISessionTask.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// A protocol that defines the interface for network tasks used in Twitter API requests.
/// This protocol provides access to task identifiers, request information, and response data,
/// as well as the ability to cancel ongoing requests.
public protocol TwitterAPISessionTask {
    /// A unique identifier for the task.
    /// This can be used to track and manage multiple concurrent tasks.
    var taskIdentifier: Int { get }
    
    /// The current URL request being processed by the task.
    /// This may differ from the original request if the request was modified (e.g., due to redirects).
    var currentRequest: URLRequest? { get }
    
    /// The original URL request that initiated this task.
    /// This remains unchanged even if the request is modified during processing.
    var originalRequest: URLRequest? { get }
    
    /// The HTTP response received from the server, if any.
    /// This property is nil until a response is received.
    var httpResponse: HTTPURLResponse? { get }

    /// Cancels the task.
    /// Once cancelled, a task cannot be resumed and must be recreated if needed.
    func cancel()
}

extension URLSessionTask: TwitterAPISessionTask {
    /// The HTTP response received from the server, if any.
    /// This implementation casts the URLSessionTask's response to HTTPURLResponse.
    public var httpResponse: HTTPURLResponse? {
        return response as? HTTPURLResponse
    }
}
