// PostListsMembersCreateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostListsMembersCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsMembersCreateRequestV1(
            list: .listID("lid"),
            user: .userID("uid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/members/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "user_id": "uid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = PostListsMembersCreateRequestV1(
            list: .slug(slug: "sl", owner: .screenName("osname")),
            user: .screenName("sname")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "osname",
                "screen_name": "sname",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
