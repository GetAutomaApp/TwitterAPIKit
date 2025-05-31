// TwitterAPISessionDelegatedStreamTaskTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal class TwitterAPISessionDelegatedStreamTaskTests: XCTestCase {
    override public func setUpWithError() throws {}

    override public func tearDownWithError() throws {}

    public func testProps() throws {
        guard let currentURL = URL(string: "http://example.com/current"),
              let originalURL = URL(string: "http://example.com/original"),
              let responseURL = URL(string: "https://example.com")
        else {
            XCTFail("Failed to create test URLs")
            return
        }

        let cReq = URLRequest(url: currentURL)
        let oReq = URLRequest(url: originalURL)
        guard let resp = HTTPURLResponse(
            url: responseURL,
            statusCode: 200,
            httpVersion: "1.1",
            headerFields: [:]
        ) else {
            XCTFail("Failed to create test response")
            return
        }

        let mockTask = MockTwitterAPISessionTask(
            taskIdentifier: 1,
            currentRequest: cReq,
            originalRequest: oReq,
            httpResponse: resp
        )

        let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

        XCTAssertEqual(mockTask.currentRequest, cReq)
        XCTAssertEqual(mockTask.originalRequest, oReq)
        XCTAssertEqual(task.httpResponse, resp)
    }

    public func test() throws {
        guard let responseURL = URL(string: "https://example.com"),
              let response = HTTPURLResponse(
                  url: responseURL,
                  statusCode: 200,
                  httpVersion: "1.1",
                  headerFields: [
                      "x-rate-limit-limit": "15",
                      "x-rate-limit-remaining": "1",
                      "x-rate-limit-reset": "1647099944",
                  ]
              )
        else {
            XCTFail("Failed to create test response")
            return
        }

        let mockTask = MockTwitterAPISessionTask(
            taskIdentifier: 1,
            currentRequest: nil,
            originalRequest: nil,
            httpResponse: response
        )

        let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

        DispatchQueue.main.async {
            task.append(chunk: Data("aaaa\r\nbbbb".utf8))
            task.append(chunk: Data("🥓🥓\r\nあ".utf8))
            task.complete(error: nil)
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 8

        var count = 0
        task
            .streamResponse { response in
                XCTAssertTrue(Thread.isMainThread)

                guard let rateLimit = response.rateLimit else {
                    XCTFail("Rate limit should not be nil")
                    return
                }

                XCTAssertEqual(rateLimit.limit, 15)
                XCTAssertEqual(rateLimit.remaining, 1)
                XCTAssertEqual(rateLimit.reset, 1_647_099_944)

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
                exp.fulfill()
            }
            .streamResponse(queue: .global(qos: .default)) { _ in
                XCTAssertFalse(Thread.isMainThread)
                exp.fulfill()
            }

        wait(for: [exp], timeout: 100)
        XCTAssertEqual(count, 4)
    }

    public func testInvalidStatusCode() throws {
        guard let responseURL = URL(string: "https://example.com"),
              let response = HTTPURLResponse(
                  url: responseURL,
                  statusCode: 400,
                  httpVersion: "1.1",
                  headerFields: [
                      "x-rate-limit-limit": "15",
                      "x-rate-limit-remaining": "1",
                      "x-rate-limit-reset": "1647099944",
                  ]
              )
        else {
            XCTFail("Failed to create test response")
            return
        }

        let mockTask = MockTwitterAPISessionTask(
            taskIdentifier: 2,
            currentRequest: nil,
            originalRequest: nil,
            httpResponse: response
        )

        let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

        DispatchQueue.main.async {
            task.append(
                chunk: Data(
                    (
                    "{\"detail\":\"Authenticating with OAuth 1.0a User Context is forbidden for this endpoint.  " +
                        "Supported authentication types are [OAuth 2.0 Application-Only].\",\"title\":\"Unsupported " +
                        "Authentication\",\"status\":403,\"type\":\"https://api.twitter.com/2/problems/unsupported-" +
                        "authentication\"}"
                    ).utf8
                )
            )
            task.complete(error: nil)
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 2

        var count = 0
        task
            .streamResponse { response in
                XCTAssertTrue(Thread.isMainThread)

                guard let rateLimit = response.rateLimit else {
                    XCTFail("Rate limit should not be nil")
                    return
                }

                XCTAssertEqual(rateLimit.limit, 15)
                XCTAssertEqual(rateLimit.remaining, 1)
                XCTAssertEqual(rateLimit.reset, 1_647_099_944)

                switch count {
                case 0:
                    guard let error = response.error else {
                        XCTFail("Expected error but got nil")
                        return
                    }
                    XCTAssertTrue(error.isResponseFailed)
                default:
                    XCTFail("Invalid Response")
                }

                count += 1
                exp.fulfill()
            }
            .streamResponse(queue: .global(qos: .default)) { response in
                XCTAssertFalse(Thread.isMainThread)
                guard let error = response.error else {
                    XCTFail("Expected error but got nil")
                    return
                }
                XCTAssertTrue(error.isResponseFailed)
                exp.fulfill()
            }

        wait(for: [exp], timeout: 100)
        XCTAssertEqual(count, 1)
    }

    public func testNilResponse() throws {
        let mockTask = MockTwitterAPISessionTask(
            taskIdentifier: 1,
            currentRequest: nil,
            originalRequest: nil,
            httpResponse: nil
        )

        let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

        DispatchQueue.main.async {
            task.append(chunk: Data("aaaa\r\nbbbb".utf8))
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 2

        var count = 0
        task
            .streamResponse { response in
                XCTAssertTrue(Thread.isMainThread)

                switch count {
                case 0:
                    XCTAssertTrue(response.isError)
                    guard let error = response.error else {
                        XCTFail("Expected error but got nil")
                        return
                    }
                    XCTAssertTrue(error.isResponseFailed)
                default:
                    XCTFail("Invalid Response")
                }

                count += 1
                exp.fulfill()
            }
            .streamResponse(queue: .global(qos: .default)) { _ in
                XCTAssertFalse(Thread.isMainThread)
                exp.fulfill()
            }

        wait(for: [exp], timeout: 100)
        XCTAssertEqual(count, 1)
    }

    public func testError() throws {
        let mockTask = MockTwitterAPISessionTask(
            taskIdentifier: 1,
            currentRequest: nil,
            originalRequest: nil,
            httpResponse: nil
        )

        let task = TwitterAPISessionDelegatedStreamTask(task: mockTask)

        DispatchQueue.main.async {
            task.complete(error: URLError(.notConnectedToInternet))
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 2

        var count = 0
        task
            .streamResponse { response in

                XCTAssertTrue(Thread.isMainThread)

                XCTAssertNil(response.rateLimit)

                switch count {
                case 0:
                    XCTAssertTrue(response.isError)

                default:
                    XCTFail("Invalid Response")
                }

                count += 1
                exp.fulfill()
            }
            .streamResponse(queue: .global(qos: .default)) { response in
                XCTAssertFalse(Thread.isMainThread)
                XCTAssertTrue(response.isError)
                exp.fulfill()
            }

        wait(for: [exp], timeout: 100)
        XCTAssertEqual(count, 1)
    }

    deinit {
        // De-init Logic Here
    }
}
