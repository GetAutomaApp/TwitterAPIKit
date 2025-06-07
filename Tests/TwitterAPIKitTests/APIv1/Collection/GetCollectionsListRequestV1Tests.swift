// GetCollectionsListRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetCollectionsListRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetCollectionsListRequestV1(
            user: .userID("uid"),
            count: 14,
            cursor: "_c_",
            tweetID: "_t_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/list.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 14,
                "cursor": "_c_",
                "tweet_id": "_t_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetCollectionsListRequestV1(
            user: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

}
