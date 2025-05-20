// GetFriendsIDsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetFriendsIDsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFriendsIDsRequestV1(
            user: .userID("uid"),
            count: 11,
            cursor: "_c_",
            stringifyIDs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/friends/ids.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 11,
                "cursor": "_c_",
                "stringify_ids": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetFriendsIDsRequestV1(
            user: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
