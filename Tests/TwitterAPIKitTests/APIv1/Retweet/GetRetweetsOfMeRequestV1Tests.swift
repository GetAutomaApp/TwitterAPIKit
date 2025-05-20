// GetRetweetsOfMeRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetRetweetsOfMeRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetRetweetsOfMeRequestV1(
            count: 10,
            sinceID: "_s_",
            maxID: "_m_",
            trimUser: true,
            includeEntities: true,
            includeUserEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/retweets_of_me.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "count": 10,
                "since_id": "_s_",
                "max_id": "_m_",
                "trim_user": true,
                "include_entities": true,
                "include_user_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetRetweetsOfMeRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
