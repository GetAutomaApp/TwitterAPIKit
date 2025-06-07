// GetTrendsClosestRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTrendsClosestRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetTrendsClosestRequestV1(
            location: TwitterCoordinateV1(lat: 37.7, long: -122.4)
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/trends/closest.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": 37.7,
                "long": -122.4,
            ]
        )
    }

}
