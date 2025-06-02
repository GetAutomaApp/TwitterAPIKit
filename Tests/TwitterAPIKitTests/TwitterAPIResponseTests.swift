// TwitterAPIResponseTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterAPIResponseTests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let rateLimit = TwitterRateLimit(header: [
            "x-rate-limit-limit": "10",
            "x-rate-limit-remaining": "1",
            "x-rate-limit-reset": "10000",
        ])
        let data = Data("{}".utf8)
        guard let url = URL(string: "https://example.com") else {
            XCTFail("Failed to decode url Response")
            return
        }

        let response: TwitterAPIResponse<Data> = TwitterAPIResponse(
            request: .init(url: url),
            response: .init(url: url, statusCode: 200, httpVersion: "1.1", headerFields: [:]),
            data: data,
            result: .success(data),
            rateLimit: rateLimit
        )

        XCTAssertEqual(response.request?.url, url)
        XCTAssertEqual(response.response?.url, url)
        XCTAssertEqual(response.success, data)
        XCTAssertEqual(try response.result.get(), data)
        XCTAssertNil(response.error)
        XCTAssertFalse(response.isError)
        XCTAssertTrue(response.prettyString.hasPrefix("-- Request success --"))

        let mapped = response.map { data in
            try? JSONSerialization.jsonObject(with: data, options: [])
        }
        XCTAssertEqual(mapped.success as? [String: String], [:])

        let mapped2 = response.tryMap { data in
            try JSONSerialization.jsonObject(with: data, options: [])
        }
        XCTAssertEqual(mapped2.success as? [String: String], [:])

        let mapped3 = response.tryMap { _ in
            throw NSError(domain: "", code: 0, userInfo: nil)
        }
        XCTAssertTrue(mapped3.isError)
        XCTAssertTrue(mapped3.prettyString.hasPrefix("-- Request failure --"))

        let errored = mapped3.mapError { _ in
            .responseFailed(reason: .invalidResponse(error: nil))
        }

        guard let error = errored.error else {
            XCTFail("No Response")
            return
        }
        XCTAssertTrue(error.isResponseFailed)

        let mapped4 = response.mapError { _ in
            XCTFail("do not call")
            fatalError()
        }

        XCTAssertNotNil(mapped4.success)
    }

    deinit {
        // De-init Logic Here
    }
}
