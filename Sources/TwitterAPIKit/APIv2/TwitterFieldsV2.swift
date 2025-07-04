// TwitterFieldsV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

internal protocol TwitterFieldsV2 {}

/// Protocol for Twitter API v2 request parameters
public protocol TwitterAPIv2RequestParameter: Hashable {
    var stringValue: String { get }
}

extension Set where Element: TwitterAPIv2RequestParameter {
    /// Extension to provide common functionality for request parameters
    public var commaSeparatedString: String {
        map(\.stringValue).joined(separator: ",")
    }
}

// MARK: - Tweet Fields

/// Tweet fields that can be requested from the Twitter API v2
public enum TwitterTweetFieldsV2: TwitterAPIv2RequestParameter, Sendable {
    case attachments
    case authorID
    case contextAnnotations
    case conversationID
    case createdAt
    case entities
    case geo
    case id
    case inReplyToUserID
    case lang
    case nonPublicMetrics
    case organicMetrics
    case other(String)
    case possiblySensitive
    case promotedMetrics
    case publicMetrics
    case referencedTweets
    case replySettings
    case source
    case text
    case withheld

    public var stringValue: String {
        switch self {
        case .attachments: "attachments"
        case .authorID: "author_id"
        case .contextAnnotations: "context_annotations"
        case .conversationID: "conversation_id"
        case .createdAt: "created_at"
        case .entities: "entities"
        case .geo: "geo"
        case .id: "id"
        case .inReplyToUserID: "in_reply_to_user_id"
        case .lang: "lang"
        case .nonPublicMetrics: "non_public_metrics"
        case .organicMetrics: "organic_metrics"
        case .other(let value): value
        case .possiblySensitive: "possibly_sensitive"
        case .promotedMetrics: "promoted_metrics"
        case .publicMetrics: "public_metrics"
        case .referencedTweets: "referenced_tweets"
        case .replySettings: "reply_settings"
        case .source: "source"
        case .text: "text"
        case .withheld: "withheld"
        }
    }

    public static let all: Set<TwitterTweetFieldsV2> = [
        .attachments,
        .authorID,
        .contextAnnotations,
        .conversationID,
        .createdAt,
        .entities,
        .geo,
        .id,
        .inReplyToUserID,
        .lang,
        .nonPublicMetrics,
        .organicMetrics,
        .possiblySensitive,
        .promotedMetrics,
        .publicMetrics,
        .referencedTweets,
        .replySettings,
        .source,
        .text,
        .withheld
    ]
}

// MARK: - User Fields

/// User fields that can be requested from the Twitter API v2
public enum TwitterUserFieldsV2: TwitterAPIv2RequestParameter, Sendable {
    case `protected`
    case createdAt
    case description
    case entities
    case id
    case location
    case name
    case other(String)
    case pinnedTweetID
    case profileImageUrl
    case publicMetrics
    case url
    case username
    case verified
    case withheld

    public var stringValue: String {
        switch self {
        case .createdAt: "created_at"
        case .description: "description"
        case .entities: "entities"
        case .id: "id"
        case .location: "location"
        case .name: "name"
        case .other(let value): value
        case .pinnedTweetID: "pinned_tweet_id"
        case .profileImageUrl: "profile_image_url"
        case .protected: "protected"
        case .publicMetrics: "public_metrics"
        case .url: "url"
        case .username: "username"
        case .verified: "verified"
        case .withheld: "withheld"
        }
    }

    public static let all: Set<Self> = [
        .createdAt,
        .description,
        .entities,
        .id,
        .location,
        .name,
        .pinnedTweetID,
        .profileImageUrl,
        .protected,
        .publicMetrics,
        .url,
        .username,
        .verified,
        .withheld
    ]
}

// MARK: - Place Fields

/// Place fields that can be requested from the Twitter API v2
public enum TwitterPlaceFieldsV2: TwitterAPIv2RequestParameter, Sendable {
    case containedWithin
    case country
    case countryCode
    case fullName
    case geo
    case id
    case name
    case other(String)
    case placeType

    public var stringValue: String {
        switch self {
        case .containedWithin: "contained_within"
        case .country: "country"
        case .countryCode: "country_code"
        case .fullName: "full_name"
        case .geo: "geo"
        case .id: "id"
        case .name: "name"
        case .other(let value): value
        case .placeType: "place_type"
        }
    }

    public static let all: Set<Self> = [
        .containedWithin,
        .country,
        .countryCode,
        .fullName,
        .geo,
        .id,
        .name,
        .placeType
    ]
}

// MARK: - Poll Fields

/// Poll fields that can be requested from the Twitter API v2
public enum TwitterPollFieldsV2: TwitterAPIv2RequestParameter, Sendable {
    case durationMinutes
    case endDatetime
    case id
    case options
    case other(String)
    case votingStatus

    public var stringValue: String {
        switch self {
        case .durationMinutes: "duration_minutes"
        case .endDatetime: "end_datetime"
        case .id: "id"
        case .options: "options"
        case .other(let value): value
        case .votingStatus: "voting_status"
        }
    }

    public static let all: Set<Self> = [
        .durationMinutes,
        .endDatetime,
        .id,
        .options,
        .votingStatus
    ]
}

// MARK: - Media Fields

/// Media fields that can be requested from the Twitter API v2
public enum TwitterMediaFieldsV2: TwitterAPIv2RequestParameter, Sendable {
    case altText
    case durationMs
    case height
    case mediaKey
    case nonPublicMetrics
    case organicMetrics
    case other(String)
    case previewImageUrl
    case promotedMetrics
    case publicMetrics
    case type
    case url
    case width

    public var stringValue: String {
        switch self {
        case .altText: "alt_text"
        case .durationMs: "duration_ms"
        case .height: "height"
        case .mediaKey: "media_key"
        case .nonPublicMetrics: "non_public_metrics"
        case .organicMetrics: "organic_metrics"
        case .other(let value): value
        case .previewImageUrl: "preview_image_url"
        case .promotedMetrics: "promoted_metrics"
        case .publicMetrics: "public_metrics"
        case .type: "type"
        case .url: "url"
        case .width: "width"
        }
    }

    public static let all: Set<Self> = [
        .altText,
        .durationMs,
        .height,
        .mediaKey,
        .nonPublicMetrics,
        .organicMetrics,
        .previewImageUrl,
        .promotedMetrics,
        .publicMetrics,
        .type,
        .url,
        .width
    ]
}

// MARK: - Parameter Binding Extensions

public extension Set where Element == TwitterTweetFieldsV2 {
    /// Bind tweet.fields to the comma separated string value for it
    func bind(param: inout [String: Any]) {
        param["tweet.fields"] = commaSeparatedString
    }
}

public extension Set where Element == TwitterUserFieldsV2 {
    /// Bind tweet.fields to the comma separated string value for it
    func bind(param: inout [String: Any]) {
        param["user.fields"] = commaSeparatedString
    }
}

public extension Set where Element == TwitterPlaceFieldsV2 {
    /// Bind tweet.fields to the comma separated string value for it
    func bind(param: inout [String: Any]) {
        param["place.fields"] = commaSeparatedString
    }
}

public extension Set where Element == TwitterPollFieldsV2 {
    /// Bind tweet.fields to the comma separated string value for it
    func bind(param: inout [String: Any]) {
        param["poll.fields"] = commaSeparatedString
    }
}

public extension Set where Element == TwitterMediaFieldsV2 {
    /// Bind tweet.fields to the comma separated string value for it
    func bind(param: inout [String: Any]) {
        param["media.fields"] = commaSeparatedString
    }
}
