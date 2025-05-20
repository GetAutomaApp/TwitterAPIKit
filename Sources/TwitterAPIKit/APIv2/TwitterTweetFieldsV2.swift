// TwitterTweetFieldsV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

// https://developer.twitter.com/en/docs/twitter-api/fields

/// tweet.fields
public enum TwitterTweetFieldsV2: TwitterAPIv2RequestParameter, Hashable {
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
        case .attachments:
            "attachments"
        case .authorID:
            "author_id"
        case .contextAnnotations:
            "context_annotations"
        case .conversationID:
            "conversation_id"
        case .createdAt:
            "created_at"
        case .entities:
            "entities"
        case .geo:
            "geo"
        case .id:
            "id"
        case .inReplyToUserID:
            "in_reply_to_user_id"
        case .lang:
            "lang"
        case .nonPublicMetrics:
            "non_public_metrics"
        case .organicMetrics:
            "organic_metrics"
        case let .other(other):
            other
        case .possiblySensitive:
            "possibly_sensitive"
        case .promotedMetrics:
            "promoted_metrics"
        case .publicMetrics:
            "public_metrics"
        case .referencedTweets:
            "referenced_tweets"
        case .replySettings:
            "reply_settings"
        case .source:
            "source"
        case .text:
            "text"
        case .withheld:
            "withheld"
        }
    }

    public static let all: Set<Self> = [
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
        .withheld,
    ]
}

/// Extension to bind tweet fields to request parameters
public extension Set<TwitterTweetFieldsV2> {
    /// Binds the tweet fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["tweet.fields"] = commaSeparatedString
    }
}

/// user.fields
public enum TwitterUserFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case createdAt
    case description
    case entities
    case id
    case location
    case name
    case other(String)
    case pinnedTweetID
    case profileImageUrl
    case protected
    case publicMetrics
    case url
    case username
    case verified
    case withheld

    public var stringValue: String {
        switch self {
        case .createdAt:
            "created_at"
        case .description:
            "description"
        case .entities:
            "entities"
        case .id:
            "id"
        case .location:
            "location"
        case .name:
            "name"
        case let .other(other):
            other
        case .pinnedTweetID:
            "pinned_tweet_id"
        case .profileImageUrl:
            "profile_image_url"
        case .protected:
            "protected"
        case .publicMetrics:
            "public_metrics"
        case .url:
            "url"
        case .username:
            "username"
        case .verified:
            "verified"
        case .withheld:
            "withheld"
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
        .withheld,
    ]
}

/// Extension to bind user fields to request parameters
public extension Set<TwitterUserFieldsV2> {
    /// Binds the user fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["user.fields"] = commaSeparatedString
    }
}

/// place.fields
public enum TwitterPlaceFieldsV2: TwitterAPIv2RequestParameter, Hashable {
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
        case .containedWithin:
            "contained_within"
        case .country:
            "country"
        case .countryCode:
            "country_code"
        case .fullName:
            "full_name"
        case .geo:
            "geo"
        case .id:
            "id"
        case .name:
            "name"
        case let .other(other):
            other
        case .placeType:
            "place_type"
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
        .placeType,
    ]
}

/// Extension to bind place fields to request parameters
public extension Set<TwitterPlaceFieldsV2> {
    /// Binds the place fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["place.fields"] = commaSeparatedString
    }
}

/// poll.fields
public enum TwitterPollFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case durationMinutes
    case endDatetime
    case id
    case options
    case other(String)
    case votingStatus

    public var stringValue: String {
        switch self {
        case .durationMinutes:
            "duration_minutes"
        case .endDatetime:
            "end_datetime"
        case .id:
            "id"
        case .options:
            "options"
        case let .other(other):
            other
        case .votingStatus:
            "voting_status"
        }
    }

    public static let all: Set<Self> = [
        .durationMinutes,
        .endDatetime,
        .id,
        .options,
        .votingStatus,
    ]
}

/// Extension to bind poll fields to request parameters
public extension Set<TwitterPollFieldsV2> {
    /// Binds the poll fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["poll.fields"] = commaSeparatedString
    }
}

/// media.fields
public enum TwitterMediaFieldsV2: TwitterAPIv2RequestParameter, Hashable {
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
    case variants
    case width

    public var stringValue: String {
        switch self {
        case .altText: "alt_text"
        case .durationMs: "duration_ms"
        case .height: "height"
        case .mediaKey: "media_key"
        case .nonPublicMetrics: "non_public_metrics"
        case .organicMetrics: "organic_metrics"
        case let .other(string): string
        case .previewImageUrl: "preview_image_url"
        case .promotedMetrics: "promoted_metrics"
        case .publicMetrics: "public_metrics"
        case .type: "type"
        case .url: "url"
        case .variants: "variants"
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
        .variants,
        .width,
    ]
}

/// Extension to bind media fields to request parameters
public extension Set<TwitterMediaFieldsV2> {
    /// Binds the media fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["media.fields"] = commaSeparatedString
    }
}

/// list.fields
public enum TwitterListFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    // swiftlint:disable sorted_enum_cases
    case createdAt
    case description
    case followerCount
    case id
    case memberCount
    case name
    case other(String)
    case ownerID
    case `private`

    public var stringValue: String {
        switch self {
        case .createdAt: "created_at"
        case .description: "description"
        case .followerCount: "follower_count"
        case .id: "id"
        case .memberCount: "member_count"
        case .name: "name"
        case let .other(string): string
        case .ownerID: "owner_id"
        case .private: "private"
        }
    }

    public static let all: Set<Self> = [
        .createdAt,
        .description,
        .followerCount,
        .id,
        .memberCount,
        .name,
        .ownerID,
        .private,
    ]
    // swiftlint:enable sorted_enum_cases
}

/// Extension to bind list fields to request parameters
public extension Set<TwitterListFieldsV2> {
    /// Binds the list fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["list.fields"] = commaSeparatedString
    }
}

/// space.fields
public enum TwitterSpaceFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case createdAt
    case creatorID
    case endedAt
    case hostIDs
    case id
    case invitedUserIDs
    case isTicketed
    case lang
    case other(String)
    case participantCount
    case scheduledStart
    case speakerIDs
    case startedAt
    case state
    case subscriberCount
    case title
    case topicIDs
    case updatedAt

    public var stringValue: String {
        switch self {
        case .createdAt: "created_at"
        case .creatorID: "creator_id"
        case .endedAt: "ended_at"
        case .hostIDs: "host_ids"
        case .id: "id"
        case .invitedUserIDs: "invited_user_ids"
        case .isTicketed: "is_ticketed"
        case .lang: "lang"
        case let .other(string): string
        case .participantCount: "participant_count"
        case .scheduledStart: "scheduled_start"
        case .speakerIDs: "speaker_ids"
        case .startedAt: "started_at"
        case .state: "state"
        case .subscriberCount: "subscriber_count"
        case .title: "title"
        case .topicIDs: "topic_ids"
        case .updatedAt: "updated_at"
        }
    }

    public static let all: Set<Self> = [
        .createdAt,
        .creatorID,
        .endedAt,
        .hostIDs,
        .id,
        .invitedUserIDs,
        .isTicketed,
        .lang,
        .participantCount,
        .scheduledStart,
        .speakerIDs,
        .startedAt,
        .state,
        .subscriberCount,
        .title,
        .topicIDs,
        .updatedAt,
    ]
}

/// Extension to bind space fields to request parameters
public extension Set<TwitterSpaceFieldsV2> {
    /// Binds the space fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["space.fields"] = commaSeparatedString
    }
}

/// topic.fields
public enum TwitterTopicFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case description
    case id
    case name
    case other(String)

    public var stringValue: String {
        switch self {
        case .description: "description"
        case .id: "id"
        case .name: "name"
        case let .other(string): string
        }
    }

    public static let all: Set<Self> = [
        .description,
        .id,
        .name,
    ]
}

/// Extension to bind topic fields to request parameters
public extension Set<TwitterTopicFieldsV2> {
    /// Binds the topic fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["topic.fields"] = commaSeparatedString
    }
}

/// A comma separated list of DmEvent fields to display.
/// dm_event.fields
public enum TwitterDmEventFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case attachments
    case createdAt
    case dmConversationID
    case eventType
    case id
    case other(String)
    case participantIDs
    case referencedTweets
    case senderID
    case text

    public var stringValue: String {
        switch self {
        case .attachments: "attachments"
        case .createdAt: "created_at"
        case .dmConversationID: "dm_conversation_id"
        case .eventType: "event_type"
        case .id: "id"
        case let .other(string): string
        case .participantIDs: "participant_ids"
        case .referencedTweets: "referenced_tweets"
        case .senderID: "sender_id"
        case .text: "text"
        }
    }

    public static let all: Set<Self> = [
        .attachments,
        .createdAt,
        .dmConversationID,
        .eventType,
        .id,
        .participantIDs,
        .referencedTweets,
        .senderID,
        .text,
    ]
}

/// Extension to bind DM event fields to request parameters
public extension Set<TwitterDmEventFieldsV2> {
    /// Binds the DM event fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["dm_event.fields"] = commaSeparatedString
    }
}

/// A comma separated list of DmConversation fields to display.
/// dm_conversation.fields
public enum TwitterDmConversationFieldsV2: TwitterAPIv2RequestParameter, Hashable {
    case id
    case other(String)

    public var stringValue: String {
        switch self {
        case .id: "id"
        case let .other(string): string
        }
    }

    public static let all: Set<Self> = [
        .id,
    ]
}

/// Extension to bind DM conversation fields to request parameters
public extension Set<TwitterDmConversationFieldsV2> {
    /// Binds the DM conversation fields to the request parameters
    /// - Parameter param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        param["dm_conversation.fields"] = commaSeparatedString
    }
}
