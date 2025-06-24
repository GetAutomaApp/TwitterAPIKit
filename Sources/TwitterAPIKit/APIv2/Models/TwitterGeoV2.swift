// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents geographic information in the Twitter API v2
public struct TwitterGeoV2: Decodable, Sendable {
    public let coordinates: TwitterCoordinatesV2?
    public let placeId: String?

    private enum CodingKeys: String, CodingKey {
        case coordinates
        case placeId = "place_id"
    }
}

/// Represents coordinates in the Twitter API v2
public struct TwitterCoordinatesV2: Decodable, Sendable {
    public let type: String
    public let coordinates: [Double]
} 
