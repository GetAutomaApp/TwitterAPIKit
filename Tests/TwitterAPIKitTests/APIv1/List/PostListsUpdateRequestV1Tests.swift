// PostListsUpdateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostListsUpdateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsUpdateRequestV1(
            list: .listID("lid"),
            name: "_n_",
            mode: .public,
            description: "_d_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/update.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "name": "_n_",
                "mode": "public",
                "description": "_d_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostListsUpdateRequestV1(
            list: .slug(slug: "sl", owner: .screenName("name"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "name",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
