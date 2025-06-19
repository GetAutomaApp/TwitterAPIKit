// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents the includes object in Twitter API v2 responses
public struct TwitterIncludesV2: Decodable, Sendable {
    public let users: [TwitterUserV2]?
    public let tweets: [TwitterTweetV2]?
    public let media: [TwitterMediaV2]?
    public let places: [TwitterPlaceV2]?
    public let polls: [TwitterPollV2]?
} 