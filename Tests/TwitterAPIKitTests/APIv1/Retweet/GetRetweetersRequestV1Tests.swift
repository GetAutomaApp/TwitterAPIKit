// GetRetweetersRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetRetweetersRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetRetweetersRequestV1(
            tweetID: "_i_",
            count: 100,
            cursor: "_c_",
            stringifyIDs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/retweeters/ids.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "count": 100,
                "cursor": "_c_",
                "stringify_ids": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetRetweetersRequestV1(
            tweetID: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
