// ConcurrencyTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

#if compiler(>=5.5.2) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    internal class ConcurrencyTests: XCTestCase {
        public func test() async throws {
            let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

            let task = TwitterAPISessionDelegatedJSONTask(
                task: mockTask
            )

            DispatchQueue.global(qos: .default).async {
                task.append(chunk: Data("{\"key\"".utf8))
                task.append(chunk: Data(":\"value\"}".utf8))

                mockTask.httpResponse = .init(
                    url: URL(string: "http://example.com"),
                    statusCode: 200,
                    httpVersion: "1.1",
                    headerFields: [:]
                )

                task.complete(error: nil)
            }

            async let response = task.responseData
            async let responseObj = task.responseObject
            async let responseDecodable = task.responseDecodable(type: DecodableObj.self)
            async let aResponse = task.specialized { _ in "a" }.responseObject

            do {
                let data = await response.success
                XCTAssertEqual(data, Data("{\"key\":\"value\"}".utf8))
            }

            do {
                let obj = await responseObj.success
                AssertEqualAnyDict(obj as? [String: Any] ?? [:], ["key": "value"])
            }

            do {
                let obj = await responseDecodable.success
                XCTAssertEqual(obj, .init(key: "value"))
            }

            do {
                let aSuccess = await aResponse.success
                XCTAssertEqual(aSuccess, "a")
            }
        }

        public func testCancel() async throws {
            let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

            let task = TwitterAPISessionDelegatedJSONTask(
                task: mockTask
            )

            DispatchQueue.global(qos: .default).async {
                task.append(chunk: Data("{\"key\"".utf8))
                task.append(chunk: Data(":\"value\"}".utf8))

                // emurate cancel
                task.cancel()
                task.complete(error: URLError(.cancelled))
            }

            async let response = task.responseData
            async let responseObj = task.responseObject
            async let responseDecodable = task.responseDecodable(type: DecodableObj.self)
            async let aResponse = task.specialized { _ in "a" }.responseObject

            do {
                let error = await response.error
                XCTAssertTrue(error != nil ? error.isCancelled : false)
            }

            do {
                let error = await responseObj.error
                XCTAssertTrue(error != nil ? error.isCancelled : false)
            }

            do {
                let error = await responseDecodable.error
                XCTAssertTrue(error != nil ? error.isCancelled : false)
            }

            do {
                let error = await aResponse.error
                XCTAssertTrue(error != nil ? error.isCancelled : false)
            }

            XCTAssertTrue(mockTask.cancelled)
        }

        public func testTaskCancel() async throws {
            let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

            let task = TwitterAPISessionDelegatedJSONTask(
                task: mockTask
            )

            let asyncTask = Task { () -> [TwitterAPIResponse<Void>] in
                async let rt0 = task.responseData.map { _ in () }
                async let rt1 = task.responseObject.map { _ in () }
                async let rt2 = task.responseDecodable(type: DecodableObj.self).map { _ in () }
                async let rt3 = task.specialized { _ in () }.responseObject
                return await [rt0, rt1, rt2, rt3]
            }

            DispatchQueue.global(qos: .default).async {
                task.append(chunk: Data("{\"key\"".utf8))
                task.append(chunk: Data(":\"value\"}".utf8))

                asyncTask.cancel()
                task.complete(error: URLError(.cancelled))
            }

            let rss = await asyncTask.value
            XCTAssertTrue(mockTask.cancelled)
            XCTAssertTrue(asyncTask.isCancelled)
            XCTAssertEqual(rss.count, 4)
            for res in rss {
                XCTAssertTrue(r.error.isCancelled)
            }
        }

        public func testStream() async throws {
            let mockTask = MockTwitterAPISessionTask(
                taskIdentifier: 1,
                currentRequest: nil,
                originalRequest: nil,
                httpResponse: .init(
                    url: URL(string: "http://example.com"),
                    statusCode: 200,
                    httpVersion: "1.1",
                    headerFields: [:]
                )
            )

            let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

            let stream = task.streamResponse(queue: .main)
            DispatchQueue.global(qos: .default).async {
                task.append(chunk: Data("aaaa\r\nbbbb".utf8))
                task.append(chunk: Data("🥓🥓\r\nあ".utf8))
            }

            var count = 0
            for await response in stream {
                switch count {
                case 0:
                    XCTAssertEqual(response.success.map { String(data: $0, encoding: .utf8) }, "aaaa")
                case 1:
                    XCTAssertEqual(response.success.map { String(data: $0, encoding: .utf8) }, "bbbb")
                case 2:
                    XCTAssertEqual(response.success.map { String(data: $0, encoding: .utf8) }, "🥓🥓")
                case 3:
                    XCTAssertEqual(response.success.map { String(data: $0, encoding: .utf8) }, "あ")
                default:
                    XCTFail("Invalid Response")
                }
                count += 1
                if count == 4 {
                    break
                }
            }
            XCTAssertEqual(count, 4)
        }

        public func testStreamCancel() async throws {
            let mockTask = MockTwitterAPISessionTask(
                taskIdentifier: 1,
                currentRequest: nil,
                originalRequest: nil,
                httpResponse: nil
            )

            let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)
            let stream = task.streamResponse(queue: .main)
            let asyncTask = Task {
                for await resp in stream {
                    XCTFail(resp.prettyString)
                }
            }

            DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + .milliseconds(1)) {
                asyncTask.cancel()
                task.append(chunk: Data("aaaa\r\nbbbb".utf8))
            }

            await asyncTask.value

            XCTAssertTrue(asyncTask.isCancelled)
            XCTAssertTrue(mockTask.cancelled)
        }

        public func testStreamError() {
            guard let exampleUrl = URL(string: "https://example.com") else {
                XCTFail("Invalid Example Url")
                return
            }

            let mockTask = MockTwitterAPISessionTask(
                taskIdentifier: 1,
                currentRequest: nil,
                originalRequest: nil,
                httpResponse: .init(
                    url: exampleUrl,
                    statusCode: 200,
                    httpVersion: "1.1",
                    headerFields: [:]
                )
            )

            let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)
            let stream = task
                .streamResponse(
                    queue: .main
                )
                .map { resp in resp.compactMap { String(data: $0, encoding: .utf8) } }
            let asyncTask = Task {
                var count = 0
                for await resp in stream {
                    switch count {
                    case 0:
                        XCTAssertEqual(resp.success, "aaaa")
                        XCTAssertFalse(resp.isError)
                    case 1:
                        XCTAssertEqual(resp.success, "bbbb")
                        XCTAssertFalse(resp.isError)
                    case 2:
                        XCTAssertTrue(resp.isError)
                    default:
                        XCTFail("Invalid Response")
                    }
                    count += 1
                }
            }

            DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + .milliseconds(1)) {
                task.append(chunk: Data("aaaa\r\nbbbb".utf8))
                task.complete(error: URLError(.badServerResponse))
                task.append(chunk: Data("ccc\r\n".utf8))
            }

            asyncTask.value
        }

        deinit {
            // De-init Logic Here
        }
    }
#endif
