// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a Twitter User in the Twitter API v2
public struct TwitterUserV2: Decodable, Sendable {
    public let id: String
    public let name: String
    public let username: String
    public let createdAt: Date?
    public let description: String?
    public let location: String?
    public let pinnedTweetId: String?
    public let profileImageUrl: String?
    public let protected: Bool?
    public let publicMetrics: TwitterPublicMetricsV2?
    public let url: String?
    public let verified: Bool?
    public let withheld: TwitterWithheldV2?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case createdAt = "created_at"
        case description
        case location
        case pinnedTweetId = "pinned_tweet_id"
        case profileImageUrl = "profile_image_url"
        case protected
        case publicMetrics = "public_metrics"
        case url
        case verified
        case withheld
    }
} 
