// TwitterRateLimitTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterRateLimitTests: XCTestCase {
    public func test() throws {
        XCTContext.runActivity(named: "from int") { _ in
            let header = [
                "x-rate-limit-limit": 15,
                "x-rate-limit-remaining": 13,
                "x-rate-limit-reset": 1_644_417_523,
            ]

            guard let rateLimit = TwitterRateLimit(header: header) else {
                XCTFail("Failed to decode rateLimit Response")
            }

            XCTAssertEqual(rateLimit.limit, 15)
            XCTAssertEqual(rateLimit.remaining, 13)
            XCTAssertEqual(rateLimit.reset, 1_644_417_523)
            XCTAssertEqual(rateLimit.resetDate.timeIntervalSince1970, 1_644_417_523)
        }

        XCTContext.runActivity(named: "from string") { _ in
            let header = [
                "x-rate-limit-limit": "15",
                "x-rate-limit-remaining": "3",
                "x-rate-limit-reset": "1644417524",
            ]

            guard let rateLimit = TwitterRateLimit(header: header) else {
                XCTFail("Failed to decode rateLimit Response")
            }

            XCTAssertEqual(rateLimit.limit, 15)
            XCTAssertEqual(rateLimit.remaining, 3)
            XCTAssertEqual(rateLimit.reset, 1_644_417_524)
        }
    }

    public func testNil() throws {
        XCTContext.runActivity(named: "limit") { _ in
            let header = [
                "x-rate-limit-remaining": "3",
                "x-rate-limit-reset": "1644417524",
            ]

            XCTAssertNil(TwitterRateLimit(header: header))
        }
        XCTContext.runActivity(named: "remaining") { _ in
            let header = [
                "x-rate-limit-limit": "15",
                "x-rate-limit-reset": "1644417524",
            ]

            XCTAssertNil(TwitterRateLimit(header: header))
        }

        XCTContext.runActivity(named: "reset") { _ in
            let header = [
                "x-rate-limit-limit": "15",
                "x-rate-limit-remaining": "3",
            ]

            XCTAssertNil(TwitterRateLimit(header: header))
        }
    }

    deinit {
        // De-init Logic Here
    }
}
