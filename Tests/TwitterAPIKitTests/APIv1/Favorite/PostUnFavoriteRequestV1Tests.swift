// PostUnFavoriteRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostUnFavoriteRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostUnFavoriteRequestV1(
            id: "_i_",
            includeEntities: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/favorites/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostUnFavoriteRequestV1(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
            ]
        )
    }

}
