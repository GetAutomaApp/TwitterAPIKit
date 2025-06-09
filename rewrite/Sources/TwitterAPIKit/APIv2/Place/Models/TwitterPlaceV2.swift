// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a place entity in the Twitter API v2
public struct TwitterPlaceV2: Decodable, Sendable {
    public let id: String
    public let fullName: String
    public let country: String?
    public let countryCode: String?
    public let geo: TwitterGeoV2?
    public let name: String?
    public let placeType: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case country
        case countryCode = "country_code"
        case geo
        case name
        case placeType = "place_type"
    }
} 