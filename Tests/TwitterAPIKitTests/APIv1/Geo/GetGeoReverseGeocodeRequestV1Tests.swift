// GetGeoReverseGeocodeRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetGeoReverseGeocodeRequestV1Tests: XCTestCase {
    public func testAccuracy() throws {
        let req = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .ft(2),
            maxResults: 10,
            granularity: .neighborhood
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/geo/reverse_geocode.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "2ft",
                "max_results": 10,
                "granularity": "neighborhood",
            ]
        )

        let req2 = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .m(3),
            maxResults: 10,
            granularity: .neighborhood
        )

        AssertEqualAnyDict(
            req2.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "3m",
                "max_results": 10,
                "granularity": "neighborhood",
            ]
        )
    }

    public func testGranularity() throws {
        let req = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .ft(2),
            maxResults: 10,
            granularity: .neighborhood
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "2ft",
                "max_results": 10,
                "granularity": "neighborhood",
            ]
        )

        let req2 = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .ft(2),
            maxResults: 10,
            granularity: .city
        )

        AssertEqualAnyDict(
            req2.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "2ft",
                "max_results": 10,
                "granularity": "city",
            ]
        )

        let req3 = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .ft(2),
            maxResults: 10,
            granularity: .admin
        )

        AssertEqualAnyDict(
            req3.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "2ft",
                "max_results": 10,
                "granularity": "admin",
            ]
        )

        let req4 = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: 1, long: 2.5),
            accuracy: .ft(2),
            maxResults: 10,
            granularity: .country
        )

        AssertEqualAnyDict(
            req4.parameters,
            [
                "lat": 1,
                "long": 2.5,
                "accuracy": "2ft",
                "max_results": 10,
                "granularity": "country",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetGeoReverseGeocodeRequestV1(
            location: .init(lat: -10, long: 100)
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "lat": -10,
                "long": 100,
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
