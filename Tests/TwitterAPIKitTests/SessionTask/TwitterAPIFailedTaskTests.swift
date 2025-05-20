// TwitterAPIFailedTaskTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterAPIFailedTaskTests: XCTestCase {
    public func test() throws {
        let task = TwitterAPIFailedTask(.responseFailed(reason: .invalidResponse(error: nil)))

        XCTAssertTrue(task.error.isResponseFailed)
        XCTAssertEqual(task.taskIdentifier, -1)
        XCTAssertNil(task.currentRequest)
        XCTAssertNil(task.originalRequest)
        XCTAssertNil(task.httpResponse)

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 8
        task.responseData { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.main))
            exp.fulfill()
        }
        .responseData(queue: .global(qos: .utility)) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.global(qos: .utility)))
            exp.fulfill()
        }
        .responseObject { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.main))
            exp.fulfill()
        }
        .responseObject(queue: .global(qos: .default)) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.global(qos: .default)))
            exp.fulfill()
        }
        .responseDecodable(type: DecodableObj.self) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.main))
            exp.fulfill()
        }
        .responseDecodable(type: DecodableObj.self, queue: .global(qos: .default)) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.global(qos: .default)))
            exp.fulfill()
        }
        .responseDecodable(type: DecodableObj.self, decoder: JSONDecoder()) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.main))
            exp.fulfill()
        }
        .responseDecodable(
            type: DecodableObj.self,
            decoder: JSONDecoder(),
            queue: .global(qos: .userInteractive)
        ) { response in

            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.global(qos: .userInteractive)))
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    public func testStream() throws {
        let task = TwitterAPIFailedTask(.responseFailed(reason: .invalidResponse(error: nil)))

        let exp = expectation(description: "")
        exp.expectedFulfillmentCount = 2
        task.streamResponse { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.main))
            exp.fulfill()
        }
        .streamResponse(queue: .global(qos: .utility)) { response in
            XCTAssertNotNil(response.error)
            XCTAssertTrue(response.isError)
            dispatchPrecondition(condition: .onQueue(.global(qos: .utility)))
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    deinit {
        // De-init Logic Here
    }
}
