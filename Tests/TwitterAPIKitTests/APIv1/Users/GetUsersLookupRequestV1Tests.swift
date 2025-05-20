// GetUsersLookupRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersLookupRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersLookupRequestV1(
            users: .userIDs(["uid1", "uid2"]),
            tweetMode: true,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/users/lookup.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid1,uid2",
                "tweet_mode": true,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersLookupRequestV1(
            users: .screenNames(["s1", "s2"])
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s1,s2",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
