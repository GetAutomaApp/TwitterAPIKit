// PostListsMembersDestroyRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostListsMembersDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsMembersDestroyRequestV1(
            list: .listID("lid"),
            user: .userID("uid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/members/destroy.json")
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
        let req = PostListsMembersDestroyRequestV1(
            list: .slug(slug: "sl", owner: .screenName("sc")),
            user: .screenName("name")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "sc",
                "screen_name": "name",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
