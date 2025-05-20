// GetRetweetsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetRetweetsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetRetweetsRequestV1(
            id: "_i_",
            count: 12,
            trimUser: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/retweets/_i_.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "count": 12,
                "trim_user": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetRetweetsRequestV1(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
