// GeoAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class GeoAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/
    /// places-near-location/api-reference/get-geo-reverse_geocode
    public func getReverseGeocode(
        _ request: GetGeoReverseGeocodeRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/
    /// place-information/api-reference/get-geo-id-place_id
    public func getGeoPlace(
        _ request: GetGeoPlaceIDRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/
    /// places-near-location/api-reference/get-geo-search
    public func searchGeo(
        _ request: GetGeoSearchRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
