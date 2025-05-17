// TwitterAPIv2Fields.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

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
            return "attachments"
        case .authorID:
            return "author_id"
        case .contextAnnotations:
            return "context_annotations"
        case .conversationID:
            return "conversation_id"
        case .createdAt:
            return "created_at"
        case .entities:
            return "entities"
        case .geo:
            return "geo"
        case .id:
            return "id"
        case .inReplyToUserID:
            return "in_reply_to_user_id"
        case .lang:
            return "lang"
        case .nonPublicMetrics:
            return "non_public_metrics"
        case .organicMetrics:
            return "organic_metrics"
        case let .other(other):
            return other
        case .possiblySensitive:
            return "possibly_sensitive"
        case .promotedMetrics:
            return "promoted_metrics"
        case .publicMetrics:
            return "public_metrics"
        case .referencedTweets:
            return "referenced_tweets"
        case .replySettings:
            return "reply_settings"
        case .source:
            return "source"
        case .text:
            return "text"
        case .withheld:
            return "withheld"
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

public extension Set where Element == TwitterTweetFieldsV2 {
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
            return "created_at"
        case .description:
            return "description"
        case .entities:
            return "entities"
        case .id:
            return "id"
        case .location:
            return "location"
        case .name:
            return "name"
        case let .other(other):
            return other
        case .pinnedTweetID:
            return "pinned_tweet_id"
        case .profileImageUrl:
            return "profile_image_url"
        case .protected:
            return "protected"
        case .publicMetrics:
            return "public_metrics"
        case .url:
            return "url"
        case .username:
            return "username"
        case .verified:
            return "verified"
        case .withheld:
            return "withheld"
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

public extension Set where Element == TwitterUserFieldsV2 {
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
            return "contained_within"
        case .country:
            return "country"
        case .countryCode:
            return "country_code"
        case .fullName:
            return "full_name"
        case .geo:
            return "geo"
        case .id:
            return "id"
        case .name:
            return "name"
        case let .other(other):
            return other
        case .placeType:
            return "place_type"
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

public extension Set where Element == TwitterPlaceFieldsV2 {
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
            return "duration_minutes"
        case .endDatetime:
            return "end_datetime"
        case .id:
            return "id"
        case .options:
            return "options"
        case let .other(other):
            return other
        case .votingStatus:
            return "voting_status"
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

public extension Set where Element == TwitterPollFieldsV2 {
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
        case .altText: return "alt_text"
        case .durationMs: return "duration_ms"
        case .height: return "height"
        case .mediaKey: return "media_key"
        case .nonPublicMetrics: return "non_public_metrics"
        case .organicMetrics: return "organic_metrics"
        case let .other(string): return string
        case .previewImageUrl: return "preview_image_url"
        case .promotedMetrics: return "promoted_metrics"
        case .publicMetrics: return "public_metrics"
        case .type: return "type"
        case .url: return "url"
        case .variants: return "variants"
        case .width: return "width"
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

public extension Set where Element == TwitterMediaFieldsV2 {
    func bind(param: inout [String: Any]) {
        param["media.fields"] = commaSeparatedString
    }
}

/// list.fields
public enum TwitterListFieldsV2: TwitterAPIv2RequestParameter, Hashable {
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
        case .createdAt: return "created_at"
        case .description: return "description"
        case .followerCount: return "follower_count"
        case .id: return "id"
        case .memberCount: return "member_count"
        case .name: return "name"
        case let .other(string): return string
        case .ownerID: return "owner_id"
        case .private: return "private"
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
}

public extension Set where Element == TwitterListFieldsV2 {
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
        case .createdAt: return "created_at"
        case .creatorID: return "creator_id"
        case .endedAt: return "ended_at"
        case .hostIDs: return "host_ids"
        case .id: return "id"
        case .invitedUserIDs: return "invited_user_ids"
        case .isTicketed: return "is_ticketed"
        case .lang: return "lang"
        case let .other(string): return string
        case .participantCount: return "participant_count"
        case .scheduledStart: return "scheduled_start"
        case .speakerIDs: return "speaker_ids"
        case .startedAt: return "started_at"
        case .state: return "state"
        case .subscriberCount: return "subscriber_count"
        case .title: return "title"
        case .topicIDs: return "topic_ids"
        case .updatedAt: return "updated_at"
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

public extension Set where Element == TwitterSpaceFieldsV2 {
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
        case .description: return "description"
        case .id: return "id"
        case .name: return "name"
        case let .other(string): return string
        }
    }

    public static let all: Set<Self> = [
        .description,
        .id,
        .name,
    ]
}

public extension Set where Element == TwitterTopicFieldsV2 {
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
        case .attachments: return "attachments"
        case .createdAt: return "created_at"
        case .dmConversationID: return "dm_conversation_id"
        case .eventType: return "event_type"
        case .id: return "id"
        case let .other(string): return string
        case .participantIDs: return "participant_ids"
        case .referencedTweets: return "referenced_tweets"
        case .senderID: return "sender_id"
        case .text: return "text"
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

public extension Set where Element == TwitterDmEventFieldsV2 {
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
        case .id: return "id"
        case let .other(string): return string
        }
    }

    public static let all: Set<Self> = [
        .id,
    ]
}

public extension Set where Element == TwitterDmConversationFieldsV2 {
    func bind(param: inout [String: Any]) {
        param["dm_conversation.fields"] = commaSeparatedString
    }
}
