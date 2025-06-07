// GetListsMembersRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsMembersRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsMembersRequestV1(
            list: .listID("lid"),
            count: 10,
            cursor: "_c_",
            includeEntities: true,
            skipStatus: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/members.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "count": 10,
                "cursor": "_c_",
                "include_entities": true,
                "skip_status": true,
            ]
        )
    }

    public func testSlugUserID() throws {
        let req = GetListsMembersRequestV1(
            list: .slug(slug: "s", owner: .userID("uid"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "s",
                "owner_id": "uid",
            ]
        )
    }

    public func testSlugScreenName() throws {
        let req = GetListsMembersRequestV1(
            list: .slug(slug: "s", owner: .screenName("s"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "s",
                "owner_screen_name": "s",
            ]
        )
    }

}
