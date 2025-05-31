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
        let header = [
            "x-rate-limit-limit": 15,
            "x-rate-limit-remaining": 13,
            "x-rate-limit-reset": 1_644_417_523,
        ]

        guard let rateLimit = TwitterRateLimit(header: header) else {
            XCTFail("Failed to decode rateLimit Response")
            return
        }

        XCTAssertEqual(rateLimit.limit, 15)
        XCTAssertEqual(rateLimit.remaining, 13)
        XCTAssertEqual(rateLimit.reset, 1_644_417_523)
        XCTAssertEqual(rateLimit.resetDate.timeIntervalSince1970, 1_644_417_523)

        let header2 = [
            "x-rate-limit-limit": "15",
            "x-rate-limit-remaining": "3",
            "x-rate-limit-reset": "1644417524",
        ]

        guard let rateLimit2 = TwitterRateLimit(header: header2) else {
            XCTFail("Failed to decode rateLimit Response")
            return
        }

        XCTAssertEqual(rateLimit2.limit, 15)
        XCTAssertEqual(rateLimit2.remaining, 3)
        XCTAssertEqual(rateLimit2.reset, 1_644_417_524)
    }

    public func testNil() throws {
        let header = [
            "x-rate-limit-remaining": "3",
            "x-rate-limit-reset": "1644417524",
        ]

        XCTAssertNil(TwitterRateLimit(header: header))

        let header2 = [
            "x-rate-limit-limit": "15",
            "x-rate-limit-reset": "1644417524",
        ]

        XCTAssertNil(TwitterRateLimit(header: header2))

        let header3 = [
            "x-rate-limit-limit": "15",
            "x-rate-limit-remaining": "3",
        ]

        XCTAssertNil(TwitterRateLimit(header: header3))
    }

    deinit {
        // De-init Logic Here
    }
}
