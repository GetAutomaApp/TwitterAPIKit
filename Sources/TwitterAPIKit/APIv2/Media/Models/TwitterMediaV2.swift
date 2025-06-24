// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a media entity in the Twitter API v2
public struct TwitterMediaV2: Decodable, Sendable {
    public let mediaKey: String
    public let type: String
    public let url: String?
    public let durationMs: Int?
    public let height: Int?
    public let width: Int?
    public let previewImageUrl: String?
    public let altText: String?

    private enum CodingKeys: String, CodingKey {
        case mediaKey = "media_key"
        case type
        case url
        case durationMs = "duration_ms"
        case height
        case width
        case previewImageUrl = "preview_image_url"
        case altText = "alt_text"
    }
} 
