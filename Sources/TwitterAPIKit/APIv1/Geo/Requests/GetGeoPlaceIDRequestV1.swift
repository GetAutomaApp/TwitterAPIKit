// GetGeoPlaceIDRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/geo/place-information/api-reference/get-geo-id-place_id
public struct GetGeoPlaceIDRequestV1: TwitterAPIRequest {
    public let placeID: String

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/geo/id/\(placeID).json"
    }

    public var parameters: [String: Any] {
        [:]
    }

    public init(
        placeID: String
    ) {
        self.placeID = placeID
    }

}
