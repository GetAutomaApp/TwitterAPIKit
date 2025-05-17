// GetStatusesShowRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetStatusesShowRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetStatusesShowRequestV1(
            id: "_i_",
            trimUser: true,
            includeCardUri: true,
            includeEntities: true,
            includeMyRetweet: true,
            includeExtAltText: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "trim_user": true,
                "include_card_uri": true,
                "include_entities": true,
                "include_my_retweet": true,
                "include_ext_alt_text": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetStatusesShowRequestV1(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
