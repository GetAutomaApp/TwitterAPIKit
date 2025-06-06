// GetListsMembershipsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsMembershipsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsMembershipsRequestV1(
            user: .userID("uid"),
            count: 11,
            cursor: "_c_",
            filterToOwnedLists: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/memberships.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 11,
                "cursor": "_c_",
                "filter_to_owned_lists": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsMembershipsRequestV1(
            user: .screenName("name")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "name",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
