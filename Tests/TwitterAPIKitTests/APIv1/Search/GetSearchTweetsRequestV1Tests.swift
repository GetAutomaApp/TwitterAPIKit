// GetSearchTweetsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSearchTweetsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetSearchTweetsRequestV1(
            query: "あああ",
            lang: "lang",
            count: 20,
            until: "2015-07-19",
            maxID: "100",
            locale: "locale",
            geocode: "geo",
            sinceID: "10",
            resultType: .popular,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/1.1/search/tweets.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "include_entities": true,
                "lang": "lang",
                "since_id": "10",
                "q": "あああ",
                "until": "2015-07-19",
                "geocode": "geo",
                "result_type": "popular",
                "count": 20,
                "max_id": "100",
                "locale": "locale",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSearchTweetsRequestV1(
            query: "_q_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "q": "_q_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
