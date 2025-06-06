// GetUsersSearchRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersSearchRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersSearchRequestV1(
            query: "_q_",
            page: 11,
            count: 100,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/users/search.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "q": "_q_",
                "page": 11,
                "count": 100,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersSearchRequestV1(
            query: "qq"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "q": "qq",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
