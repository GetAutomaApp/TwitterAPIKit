// TwitterAPISessionSpecializedTaskTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import XCTest

@testable import TwitterAPIKit

internal class TwitterAPISessionSpecializedTaskTests: XCTestCase {
    public func test() throws {
        let mockTask = MockTwitterAPISessionDataTask(
            data: Data("hoge".utf8), taskIdentifier: 10, currentRequest: nil, originalRequest: nil, httpResponse: nil
        )

        let task = TwitterAPISessionSpecializedTask(task: mockTask) { data in
            guard let str = String(data: data, encoding: .utf8) else {
                XCTFail("Failed to decode UTF-8 string")
                return ""
            }
            return str
        }

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 2
        task
            .responseObject(queue: .main) { response in
                XCTAssertEqual(response.success, "hoge")
                exp.fulfill()
            }
            .responseData { response in
                XCTAssertEqual(response.success, Data("hoge".utf8))
                exp.fulfill()
            }

        wait(for: [exp], timeout: 100)
    }

    public func testArray() throws {
        let mockTask1 = MockTwitterAPISessionDataTask(
            data: Data("hoge1".utf8), taskIdentifier: 10, currentRequest: nil, originalRequest: nil, httpResponse: nil
        )
        let mockTask2 = MockTwitterAPISessionDataTask(
            data: Data("hoge2".utf8), taskIdentifier: 10, currentRequest: nil, originalRequest: nil, httpResponse: nil
        )

        let task1 = TwitterAPISessionSpecializedTask(task: mockTask1) { data in
            guard let str = String(data: data, encoding: .utf8) else {
                XCTFail("Failed to decode UTF-8 string")
                return ""
            }
            return str
        }

        let task2 = TwitterAPISessionSpecializedTask(task: mockTask2) { data in
            guard let str = String(data: data, encoding: .utf8) else {
                XCTFail("Failed to decode UTF-8 string")
                return ""
            }
            return str
        }

        let exp = expectation(description: "")

        [task1, task2].responseObject { responses in
            XCTAssertEqual(responses.count, 2)
            XCTAssertEqual(responses[0].success, "hoge1")
            XCTAssertEqual(responses[1].success, "hoge2")

            exp.fulfill()
        }

        wait(for: [exp], timeout: 100)
    }

    deinit {
        // De-init Logic Here
    }
}
