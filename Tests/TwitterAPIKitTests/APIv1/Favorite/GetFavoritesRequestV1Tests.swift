// GetFavoritesRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetFavoritesRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFavoritesRequestV1(
            target: .userID("uid"),
            count: 100,
            sinceID: "_s_",
            maxID: "_m_",
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/favorites/list.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 100,
                "since_id": "_s_",
                "max_id": "_m_",
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetFavoritesRequestV1(
            target: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
