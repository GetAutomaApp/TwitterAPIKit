// GetStatusesLookupRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetStatusesLookupRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetStatusesLookupRequestV1(
            ids: ["a", "b"],
            map: true,
            trimUser: true,
            includeCardUri: true,
            includeEntities: true,
            includeExtAltText: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/lookup.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "a,b",
                "map": true,
                "trim_user": true,
                "include_card_uri": true,
                "include_entities": true,
                "include_ext_alt_text": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetStatusesLookupRequestV1(
            ids: ["a"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "a",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
