// GetTrendsPlaceRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetTrendsPlaceRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetTrendsPlaceRequestV1(
            woeid: "_w_",
            exclude: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/trends/place.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "woeid": "_w_",
                "exclude": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTrendsPlaceRequestV1(
            woeid: "_w_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "woeid": "_w_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
