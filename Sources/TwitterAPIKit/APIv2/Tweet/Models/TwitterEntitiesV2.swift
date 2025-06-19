// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents entities in a tweet in the Twitter API v2
public struct TwitterEntitiesV2: Decodable, Sendable {
    public let annotations: [Annotation]?
    public let cashtags: [Cashtag]?
    public let hashtags: [Hashtag]?
    public let mentions: [Mention]?
    public let urls: [URLEntity]?
    
    public struct Annotation: Decodable, Sendable {
        public let start: Int
        public let end: Int
        public let probability: Double
        public let type: String
        public let normalizedText: String
        
        private enum CodingKeys: String, CodingKey {
            case start
            case end
            case probability
            case type
            case normalizedText = "normalized_text"
        }
    }
    
    public struct Cashtag: Decodable, Sendable {
        public let start: Int
        public let end: Int
        public let tag: String
    }
    
    public struct Hashtag: Decodable, Sendable {
        public let start: Int
        public let end: Int
        public let tag: String
    }
    
    public struct Mention: Decodable, Sendable {
        public let start: Int
        public let end: Int
        public let username: String
        public let id: String
    }
    
    public struct URLEntity: Decodable, Sendable {
        public let start: Int
        public let end: Int
        public let url: String
        public let expandedUrl: String
        public let displayUrl: String
        public let status: Int?
        public let title: String?
        public let description: String?
        public let unwoundUrl: String?
        
        private enum CodingKeys: String, CodingKey {
            case start
            case end
            case url
            case expandedUrl = "expanded_url"
            case displayUrl = "display_url"
            case status
            case title
            case description
            case unwoundUrl = "unwound_url"
        }
    }
} 