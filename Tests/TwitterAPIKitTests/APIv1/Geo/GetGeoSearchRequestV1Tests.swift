// GetGeoSearchRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetGeoSearchRequestV1Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = GetGeoSearchRequestV1(
            location: .coordinate(.init(lat: 10.12, long: -20)),
            maxResults: 13,
            granularity: .country
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/geo/search.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": 10.12,
                "long": -20,
                "max_results": 13,
                "granularity": "country",
            ]
        )

        let req2 = GetGeoSearchRequestV1(
            location: .query("日本"),
            maxResults: 13,
            granularity: .country
        )
        AssertEqualAnyDict(
            req2.parameters,
            [
                "query": "日本",
                "max_results": 13,
                "granularity": "country",
            ]
        )

        let req3 = GetGeoSearchRequestV1(
            location: .ip("0.0.0.0"),
            maxResults: 13,
            granularity: .country
        )
        AssertEqualAnyDict(
            req3.parameters,
            [
                "ip": "0.0.0.0",
                "max_results": 13,
                "granularity": "country",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetGeoSearchRequestV1(
            location: .coordinate(.init(lat: 10.123, long: -20.1))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": 10.123,
                "long": -20.1,
            ]
        )
    }

}
