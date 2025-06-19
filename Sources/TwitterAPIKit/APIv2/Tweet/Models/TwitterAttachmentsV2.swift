// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents attachments in a tweet in the Twitter API v2
public struct TwitterAttachmentsV2: Decodable, Sendable {
    public let mediaKeys: [String]?
    public let pollIds: [String]?

    private enum CodingKeys: String, CodingKey {
        case mediaKeys = "media_keys"
        case pollIds = "poll_ids"
    }
} 