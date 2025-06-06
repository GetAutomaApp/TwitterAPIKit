// TwitterAPISessionDelegatedJSONTaskTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal struct DecodableObj: Decodable, Equatable {
    public let key: String
}

internal class TwitterAPISessionDelegatedJSONTaskTests: XCTestCase {
    // swiftlint:disable:next force_unwrapping
    internal let testURL = URL(string: "http://example.com")!

    // swiftlint:disable:next function_body_length
    public func testSuccess() throws {
        let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

        let task = TwitterAPISessionDelegatedJSONTask(
            task: mockTask
        )

        XCTAssertEqual(task.taskIdentifier, 1)

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 6

        _ = task.responseData(queue: .global(qos: .background)) { response in

            XCTAssertEqual(response.success, Data("{\"key\":\"value\"}".utf8))
            XCTAssertNotNil(response.rateLimit)
            XCTAssertEqual(response.rateLimit?.limit, 15)
            XCTAssertEqual(response.rateLimit?.remaining, 1)
            XCTAssertEqual(response.rateLimit?.reset, 1_647_099_944)

            XCTAssertFalse(Thread.isMainThread)
            exp.fulfill()
        }
        .responseData { _ in
            XCTAssertTrue(Thread.isMainThread)
            exp.fulfill()
        }
        .responseObject(queue: .global(qos: .background)) { response in
            if let dict = response.success as? [String: Any] {
                AssertEqualAnyDict(dict, ["key": "value"])
            } else {
                XCTFail("Expected response.success to be [String: Any]")
            }
            XCTAssertFalse(Thread.isMainThread)
            exp.fulfill()
        }
        .responseObject { _ in
            XCTAssertTrue(Thread.isMainThread)
            exp.fulfill()
        }
        .responseDecodable(type: DecodableObj.self, queue: .global(qos: .background)) { response in
            XCTAssertEqual(response.success, .init(key: "value"))
            XCTAssertFalse(Thread.isMainThread)
            exp.fulfill()
        }
        .responseDecodable(type: DecodableObj.self) { _ in
            XCTAssertTrue(Thread.isMainThread)
            exp.fulfill()
        }

        DispatchQueue.global(qos: .background).async {
            task.append(chunk: Data("{\"key\"".utf8))
            task.append(chunk: Data(":\"value\"}".utf8))

            mockTask.httpResponse = .init(
                url: self.testURL,
                statusCode: 200,
                httpVersion: "1.1",
                headerFields: [
                    "x-rate-limit-limit": "15",
                    "x-rate-limit-remaining": "1",
                    "x-rate-limit-reset": "1647099944",
                ]
            )

            task.complete(error: nil)
        }

        wait(for: [exp], timeout: 10)
    }

    // swiftlint:disable:next function_body_length
    public func testInvalidStatusCode() throws {
        let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

        let task = TwitterAPISessionDelegatedJSONTask(
            task: mockTask
        )

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 3

        _ = task
            .responseData(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                XCTAssertNotNil(response.rateLimit)
                XCTAssertEqual(response.rateLimit?.limit, 100)
                XCTAssertEqual(response.rateLimit?.remaining, 2)
                XCTAssertEqual(response.rateLimit?.reset, 1_647_099_945)

                exp.fulfill()
            }
            .responseObject(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }
            .responseDecodable(type: DecodableObj.self, queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }

        DispatchQueue.global(qos: .background).async {
            task.append(chunk: Data("{\"key\"".utf8))
            task.append(chunk: Data(":\"value\"}".utf8))

            // Status code is 400
            mockTask.httpResponse = .init(
                url: self.testURL,
                statusCode: 400,
                httpVersion: "1.1",
                headerFields: [
                    "x-rate-limit-limit": "100",
                    "x-rate-limit-remaining": "2",
                    "x-rate-limit-reset": "1647099945",
                ]
            )

            task.complete(error: nil)
        }

        wait(for: [exp], timeout: 10)
    }

    // swiftlint:disable:next function_body_length
    public func testCompleteWithError() throws {
        let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

        let task = TwitterAPISessionDelegatedJSONTask(
            task: mockTask
        )

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 3

        _ = task
            .responseData(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                if let urlError = response.error?.underlyingError as? URLError {
                    XCTAssertEqual(urlError, URLError(.badServerResponse))
                } else {
                    XCTFail("Expected URLError")
                }
                exp.fulfill()
            }
            .responseObject(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }
            .responseDecodable(type: DecodableObj.self, queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }

        DispatchQueue.global(qos: .background).async {
            task.append(chunk: Data("{\"key\"".utf8))
            task.append(chunk: Data(":\"value\"}".utf8))

            mockTask.httpResponse = .init(
                url: self.testURL, statusCode: 200, httpVersion: "1.1", headerFields: [:]
            )

            task.complete(error: URLError(.badServerResponse))
        }

        wait(for: [exp], timeout: 10)
    }

    // swiftlint:disable:next function_body_length
    public func testCancel() throws {
        let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)

        let task = TwitterAPISessionDelegatedJSONTask(
            task: mockTask
        )

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 3

        _ = task
            .responseData(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                if let urlError = response.error?.underlyingError as? URLError {
                    XCTAssertEqual(urlError, URLError(.cancelled))
                } else {
                    XCTFail("Expected URLError")
                }
                exp.fulfill()
            }
            .responseObject(queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }
            .responseDecodable(type: DecodableObj.self, queue: .global(qos: .background)) { response in
                XCTAssertTrue(response.isError)
                if let urlError = response.error?.underlyingError as? URLError {
                    XCTAssertEqual(urlError, URLError(.cancelled))
                } else {
                    XCTFail("Expected URLError")
                }
                exp.fulfill()
            }

        DispatchQueue.global(qos: .background).async {
            task.append(chunk: Data("{\"key\"".utf8))
            task.append(chunk: Data(":\"value\"}".utf8))

            mockTask.httpResponse = .init(
                url: self.testURL, statusCode: 200, httpVersion: "1.1", headerFields: [:]
            )

            task.complete(error: URLError(.cancelled))
        }

        task.cancel()

        wait(for: [exp], timeout: 10)
        XCTAssertTrue(mockTask.cancelled)
    }

    public func testEXC_BAD_INSTRUCTION() throws {
        // EXC_BAD_INSTRUCTION will occur if the Dispatch Queue is released while suspended.
        let mockTask = MockTwitterAPISessionTask(taskIdentifier: 1)
        _ = TwitterAPISessionDelegatedJSONTask(task: mockTask)
    }

    deinit {
        // De-init Logic Here
    }
}
