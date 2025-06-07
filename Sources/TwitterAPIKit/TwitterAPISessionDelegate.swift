// TwitterAPISessionDelegate.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Protocol for delegated tasks that can receive data in chunks and handle completion
public protocol TwitterAPISessionDelegatedTask {
    /// The unique identifier for this task
    var taskIdentifier: Int { get }

    /// Appends a chunk of data received from the network
    /// - Parameter chunk: The data chunk to append
    mutating func append(chunk: Data)

    /// Called when the task completes, with an optional error
    /// - Parameter error: The error that occurred, if any
    mutating func complete(error: Error?)
}

public class TwitterAPISessionDelegate: NSObject, URLSessionDataDelegate, @unchecked Sendable {
    private var tasks = [Int /* taskIdentifier */: TwitterAPISessionDelegatedTask]()

    public func appendAndResume(task: URLSessionTask) -> TwitterAPISessionJSONTask {
        var twTask = TwitterAPISessionDelegatedJSONTask(task: task)
        twTask.delegate = self
        tasks[task.taskIdentifier] = twTask

        task.resume()

        return twTask
    }

    public func appendAndResumeStream(task: URLSessionTask) -> TwitterAPISessionDelegatedStreamTask {
        let twTask = TwitterAPISessionDelegatedStreamTask(task: task)
        tasks[task.taskIdentifier] = twTask
        task.resume()
        return twTask
    }

    public func urlSession(_: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        tasks[dataTask.taskIdentifier]?.append(chunk: data)
    }

    public func urlSession(_: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard var task = tasks[task.taskIdentifier] else { return }

        task.complete(error: error)
    }

}

extension TwitterAPISessionDelegate: TwitterAPISessionDelegatedJSONTaskDelegate {
    public func didFinishQueueInJsonTask(task: TwitterAPISessionDelegatedJSONTask) {
        tasks[task.taskIdentifier] = nil
    }
}
