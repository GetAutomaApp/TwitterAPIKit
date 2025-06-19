// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents withheld content information for a Twitter entity
public struct TwitterWithheldV2: Decodable, Sendable {
    public let copyright: Bool
    public let countryCodes: [String]

    private enum CodingKeys: String, CodingKey {
        case copyright
        case countryCodes = "country_codes"
    }
} 