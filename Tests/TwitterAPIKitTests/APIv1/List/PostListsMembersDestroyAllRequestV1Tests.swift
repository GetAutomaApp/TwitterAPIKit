// PostListsMembersDestroyAllRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostListsMembersDestroyAllRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsMembersDestroyAllRequestV1(
            list: .listID("lid"),
            users: .userIDs(["uid1", "uid2"])
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/members/destroy_all.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "user_id": "uid1,uid2",
            ]
        )
    }

    public func testScreenName() throws {
        let req = PostListsMembersDestroyAllRequestV1(
            list: .slug(slug: "sl", owner: .screenName("oname")),
            users: .screenNames(["s1", "s2"])
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "oname",
                "screen_name": "s1,s2",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
