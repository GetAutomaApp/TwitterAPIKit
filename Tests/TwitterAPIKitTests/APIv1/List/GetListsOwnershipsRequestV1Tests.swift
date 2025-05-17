// GetListsOwnershipsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetListsOwnershipsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsOwnershipsRequestV1(
            user: .userID("uid"),
            count: 21,
            cursor: "_c_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/ownerships.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 21,
                "cursor": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsOwnershipsRequestV1(
            user: .screenName("name")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "name",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
