// GetListsSubscribersShowRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsSubscribersShowRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsSubscribersShowRequestV1(
            list: .listID("lid"),
            user: .userID("uid"),
            includeEntities: true,
            skipStatus: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/subscribers/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "user_id": "uid",
                "include_entities": true,
                "skip_status": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsSubscribersShowRequestV1(
            list: .slug(slug: "sl", owner: .screenName("sn")),
            user: .userID("uid")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "sn",
                "user_id": "uid",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
