// TwitterAPISessionDelegate.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public protocol TwitterAPISessionDelegatedTask {
    var taskIdentifier: Int { get }
    func append(chunk: Data)
    func complete(error: Error?)
}

public class TwitterAPISessionDelegate: NSObject, URLSessionDataDelegate {
    private var tasks = [Int /* taskIdentifier */: TwitterAPISessionDelegatedTask]()

    public func appendAndResume(task: URLSessionTask) -> TwitterAPISessionJSONTask {
        let twTask = TwitterAPISessionDelegatedJSONTask(task: task)
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
        guard let task = tasks[task.taskIdentifier] else { return }

        task.complete(error: error)
    }
}

extension TwitterAPISessionDelegate: TwitterAPISessionDelegatedJSONTaskDelegate {
    public func didFinishQueueInJsonTask(task: TwitterAPISessionDelegatedJSONTask) {
        tasks[task.taskIdentifier] = nil
    }
}
