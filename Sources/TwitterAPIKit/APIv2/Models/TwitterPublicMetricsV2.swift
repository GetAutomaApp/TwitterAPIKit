// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents public metrics for a Twitter entity (Tweet or User)
public struct TwitterPublicMetricsV2: Decodable, Sendable {
    public let retweetCount: Int
    public let replyCount: Int
    public let likeCount: Int
    public let quoteCount: Int
    public let followersCount: Int?
    public let followingCount: Int?
    public let tweetCount: Int?
    public let listedCount: Int?

    private enum CodingKeys: String, CodingKey {
        case retweetCount = "retweet_count"
        case replyCount = "reply_count"
        case likeCount = "like_count"
        case quoteCount = "quote_count"
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case tweetCount = "tweet_count"
        case listedCount = "listed_count"
    }
} 