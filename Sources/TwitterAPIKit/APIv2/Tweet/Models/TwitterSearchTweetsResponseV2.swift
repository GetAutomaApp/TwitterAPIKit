// TwitterSearchTweetsResponseV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Response type for tweet search endpoints
public struct TwitterSearchTweetsResponseV2: Decodable, Sendable {
    public let data: [TwitterTweetV2]
    public let includes: TwitterIncludesV2?
    public let meta: Meta
    
    public struct Meta: Decodable, Sendable {
        public let resultCount: Int
        public let nextToken: String?
        
        private enum CodingKeys: String, CodingKey {
            case resultCount = "result_count"
            case nextToken = "next_token"
        }
    }
} 