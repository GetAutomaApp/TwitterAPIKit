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
    public func test() throws {
        XCTContext.runActivity(named: "coordinate") { _ in

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
        }

        XCTContext.runActivity(named: "query") { _ in
            let req = GetGeoSearchRequestV1(
                location: .query("日本"),
                maxResults: 13,
                granularity: .country
            )
            AssertEqualAnyDict(
                req.parameters,
                [
                    "query": "日本",
                    "max_results": 13,
                    "granularity": "country",
                ]
            )
        }

        XCTContext.runActivity(named: "ip") { _ in
            let req = GetGeoSearchRequestV1(
                location: .ip("0.0.0.0"),
                maxResults: 13,
                granularity: .country
            )
            AssertEqualAnyDict(
                req.parameters,
                [
                    "ip": "0.0.0.0",
                    "max_results": 13,
                    "granularity": "country",
                ]
            )
        }
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

    deinit {
        // De-init Logic Here
    }
}
