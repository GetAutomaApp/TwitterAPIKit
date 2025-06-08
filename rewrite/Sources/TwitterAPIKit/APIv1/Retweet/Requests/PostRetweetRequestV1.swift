// PostRetweetRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a Tweet in the Twitter API v1
public struct TweetV1: Codable, Sendable {
    public let createdAt: Date
    public let id: Int64
    public let idStr: String
    public let text: String
    public let source: String
    public let truncated: Bool
    public let inReplyToStatusId: Int64?
    public let inReplyToStatusIdStr: String?
    public let inReplyToUserId: Int64?
    public let inReplyToUserIdStr: String?
    public let inReplyToScreenName: String?
    public let user: TwitterUserV1
    public let geo: TwitterGeoV1?
    public let coordinates: TwitterCoordinatesV1?
    public let place: TwitterPlaceV1?
    public let contributors: [TwitterContributorV1]?
    public let isQuoteStatus: Bool
    public let retweetCount: Int
    public let favoriteCount: Int
    public let favorited: Bool
    public let retweeted: Bool
    public let lang: String
    public let retweetedStatus: RetweetedStatusV1?
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case idStr = "id_str"
        case text
        case source
        case truncated
        case inReplyToStatusId = "in_reply_to_status_id"
        case inReplyToStatusIdStr = "in_reply_to_status_id_str"
        case inReplyToUserId = "in_reply_to_user_id"
        case inReplyToUserIdStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user
        case geo
        case coordinates
        case place
        case contributors
        case isQuoteStatus = "is_quote_status"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case favorited
        case retweeted
        case lang
        case retweetedStatus = "retweeted_status"
    }
}

/// Represents a retweeted status in the Twitter API v1
public struct RetweetedStatusV1: Codable, Sendable {
    public let createdAt: Date
    public let id: Int64
    public let idStr: String
    public let text: String
    public let source: String
    public let truncated: Bool
    public let inReplyToStatusId: Int64?
    public let inReplyToStatusIdStr: String?
    public let inReplyToUserId: Int64?
    public let inReplyToUserIdStr: String?
    public let inReplyToScreenName: String?
    public let user: TwitterUserV1
    public let geo: TwitterGeoV1?
    public let coordinates: TwitterCoordinatesV1?
    public let place: TwitterPlaceV1?
    public let contributors: [TwitterContributorV1]?
    public let isQuoteStatus: Bool
    public let retweetCount: Int
    public let favoriteCount: Int
    public let favorited: Bool
    public let retweeted: Bool
    public let lang: String
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case idStr = "id_str"
        case text
        case source
        case truncated
        case inReplyToStatusId = "in_reply_to_status_id"
        case inReplyToStatusIdStr = "in_reply_to_status_id_str"
        case inReplyToUserId = "in_reply_to_user_id"
        case inReplyToUserIdStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user
        case geo
        case coordinates
        case place
        case contributors
        case isQuoteStatus = "is_quote_status"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case favorited
        case retweeted
        case lang
    }
}

/// Represents a Twitter user in the Twitter API v1
public struct TwitterUserV1: Codable, Sendable {
    public let id: Int64
    public let idStr: String
    public let name: String
    public let screenName: String
    public let location: String?
    public let description: String?
    public let url: String?
    public let protected: Bool
    public let followersCount: Int
    public let friendsCount: Int
    public let listedCount: Int
    public let createdAt: Date
    public let favouritesCount: Int
    public let utcOffset: Int?
    public let timeZone: String?
    public let geoEnabled: Bool
    public let verified: Bool
    public let statusesCount: Int
    public let lang: String?
    public let contributorsEnabled: Bool
    public let isTranslator: Bool
    public let isTranslationEnabled: Bool
    public let profileBackgroundColor: String
    public let profileBackgroundImageUrl: String?
    public let profileBackgroundImageUrlHttps: String?
    public let profileBackgroundTile: Bool
    public let profileImageUrl: String
    public let profileImageUrlHttps: String
    public let profileBannerUrl: String?
    public let profileLinkColor: String
    public let profileSidebarBorderColor: String
    public let profileSidebarFillColor: String
    public let profileTextColor: String
    public let profileUseBackgroundImage: Bool
    public let hasExtendedProfile: Bool
    public let defaultProfile: Bool
    public let defaultProfileImage: Bool
    public let following: Bool
    public let followRequestSent: Bool
    public let notifications: Bool
    public let translatorType: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case name
        case screenName = "screen_name"
        case location
        case description
        case url
        case protected
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case listedCount = "listed_count"
        case createdAt = "created_at"
        case favouritesCount = "favourites_count"
        case utcOffset = "utc_offset"
        case timeZone = "time_zone"
        case geoEnabled = "geo_enabled"
        case verified
        case statusesCount = "statuses_count"
        case lang
        case contributorsEnabled = "contributors_enabled"
        case isTranslator = "is_translator"
        case isTranslationEnabled = "is_translation_enabled"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageUrl = "profile_background_image_url"
        case profileBackgroundImageUrlHttps = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileImageUrl = "profile_image_url"
        case profileImageUrlHttps = "profile_image_url_https"
        case profileBannerUrl = "profile_banner_url"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case hasExtendedProfile = "has_extended_profile"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case following
        case followRequestSent = "follow_request_sent"
        case notifications
        case translatorType = "translator_type"
    }
}

/// Represents geo information in the Twitter API v1
public struct TwitterGeoV1: Codable, Sendable {
    public let type: String
    public let coordinates: [Double]
}

/// Represents coordinates in the Twitter API v1
public struct TwitterCoordinatesV1: Codable, Sendable {
    public let type: String
    public let coordinates: [Double]
}

/// Represents a place in the Twitter API v1
public struct TwitterPlaceV1: Codable, Sendable {
    public let id: String
    public let url: String
    public let placeType: String
    public let name: String
    public let fullName: String
    public let countryCode: String
    public let country: String
    public let boundingBox: TwitterBoundingBoxV1
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case placeType = "place_type"
        case name
        case fullName = "full_name"
        case countryCode = "country_code"
        case country
        case boundingBox = "bounding_box"
    }
}

/// Represents a bounding box in the Twitter API v1
public struct TwitterBoundingBoxV1: Codable, Sendable {
    public let type: String
    public let coordinates: [[[Double]]]
}

/// Represents a contributor in the Twitter API v1
public struct TwitterContributorV1: Codable, Sendable {
    public let id: Int64
    public let idStr: String
    public let screenName: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case idStr = "id_str"
        case screenName = "screen_name"
    }
}

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-retweet-id
public struct PostRetweetRequestV1: TwitterAPIRequest {
    public typealias Response = TweetV1
    
    public let id: String
    public let trimUser: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/statuses/retweet/\(id).json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        trimUser.map { params["trim_user"] = $0 }
        return params
    }

    public init(
        id: String,
        trimUser: Bool? = .none
    ) {
        self.id = id
        self.trimUser = trimUser
    }
}