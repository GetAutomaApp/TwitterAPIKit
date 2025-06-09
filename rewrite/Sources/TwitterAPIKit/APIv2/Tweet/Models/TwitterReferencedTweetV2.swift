// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a referenced tweet in the Twitter API v2
public struct TwitterReferencedTweetV2: Decodable, Sendable {
    public let type: ReferencedTweetType
    public let id: String
    
    public enum ReferencedTweetType: String, Decodable, Sendable {
        case repliedTo = "replied_to"
        case retweeted = "retweeted"
        case quoted = "quoted"
    }
} 