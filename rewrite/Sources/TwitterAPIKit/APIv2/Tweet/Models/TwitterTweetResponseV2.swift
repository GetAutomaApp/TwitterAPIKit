// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Response type for the GetTweet endpoint
public struct TwitterTweetResponseV2: Decodable, Sendable {
    public let data: TwitterTweetV2
    public let includes: TwitterIncludesV2?
}
