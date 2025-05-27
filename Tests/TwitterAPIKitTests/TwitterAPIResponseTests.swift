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

        XCTContext.runActivity(named: "map") { _ in
            let mapped = response.map { data in
                try? JSONSerialization.jsonObject(with: data, options: [])
            }
            XCTAssertEqual(mapped.success as? [String: String], [:])
        }

        XCTContext.runActivity(named: "tryMap") { _ in
            let mapped = response.tryMap { data in
                try JSONSerialization.jsonObject(with: data, options: [])
            }
            XCTAssertEqual(mapped.success as? [String: String], [:])
        }

        XCTContext.runActivity(named: "tryMapWithError") { _ in
            let mapped = response.tryMap { _ in
                throw NSError(domain: "", code: 0, userInfo: nil)
            }
            XCTAssertTrue(mapped.isError)
            XCTAssertTrue(mapped.prettyString.hasPrefix("-- Request failure --"))

            XCTContext.runActivity(named: "mapError") { _ in
                let errored = mapped.mapError { _ in
                    .responseFailed(reason: .invalidResponse(error: nil))
                }

                guard let error = errored.error else {
                    XCTFail("No Response")
                    return
                }
                XCTAssertTrue(error.isResponseFailed)
            }
        }

        XCTContext.runActivity(named: "mapError") { _ in
            let mapped = response.mapError { _ in
                XCTFail("do not call")
                fatalError()
            }

            XCTAssertNotNil(mapped.success)
        }
    }

    deinit {
        // De-init Logic Here
    }
}
