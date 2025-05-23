// GetListsSubscriptionsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsSubscriptionsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsSubscriptionsRequestV1(
            user: .userID("uid"),
            count: 19,
            cursor: "_c_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/subscriptions.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 19,
                "cursor": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsSubscriptionsRequestV1(
            user: .screenName("sn")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "sn",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
