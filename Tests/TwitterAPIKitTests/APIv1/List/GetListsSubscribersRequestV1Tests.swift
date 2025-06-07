// GetListsSubscribersRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsSubscribersRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsSubscribersRequestV1(
            list: .listID("lid"),
            count: 17,
            cursor: "_c_",
            includeEntities: true,
            skipStatus: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/subscribers.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "count": 17,
                "cursor": "_c_",
                "include_entities": true,
                "skip_status": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsSubscribersRequestV1(
            list: .slug(slug: "sl", owner: .userID("uid"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_id": "uid",
            ]
        )
    }

}
