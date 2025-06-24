// TwitterExpansionsV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Protocol for Twitter API v2 expansion parameters
public protocol TwitterExpansionsV2: TwitterAPIv2RequestParameter {}

/// Extension to bind expansions to request parameters
public extension Set where Element: TwitterExpansionsV2 {
    /// Binds the expansions to comma separated strings
    func bind(param: inout [String: Any]) {
        param["expansions"] = commaSeparatedString
    }
}

// MARK: - Tweet Expansions

/// Tweet expansions that can be requested from the Twitter API v2
public enum TwitterTweetExpansionsV2: String, TwitterExpansionsV2, Sendable {
    case attachmentsMediaKeys = "attachments.media_keys"
    case attachmentsPollIDs = "attachments.poll_ids"
    case authorID = "author_id"
    case entitiesMentionsUsername = "entities.mentions.username"
    case geoPlaceID = "geo.place_id"
    case inReplyToUserID = "in_reply_to_user_id"
    case referencedTweetsID = "referenced_tweets.id"
    case referencedTweetsIDAuthorID = "referenced_tweets.id.author_id"

    public var stringValue: String { rawValue }

    public static let all: Set<TwitterTweetExpansionsV2> = [
        .attachmentsMediaKeys,
        .attachmentsPollIDs,
        .authorID,
        .entitiesMentionsUsername,
        .geoPlaceID,
        .inReplyToUserID,
        .referencedTweetsID,
        .referencedTweetsIDAuthorID
    ]
}

// MARK: - User Expansions

/// User expansions that can be requested from the Twitter API v2
public enum TwitterUserExpansionsV2: String, TwitterExpansionsV2, Sendable {
    case pinnedTweetID = "pinned_tweet_id"

    public var stringValue: String { rawValue }

    public static let all: Set<TwitterUserExpansionsV2> = [
        .pinnedTweetID
    ]
}

// MARK: - List Expansions

/// List expansions that can be requested from the Twitter API v2
public enum TwitterListExpansionsV2: String, TwitterExpansionsV2, Sendable {
    case ownerID = "owner_id"

    public var stringValue: String { rawValue }

    public static let all: Set<TwitterListExpansionsV2> = [
        .ownerID
    ]
}

// MARK: - Space Expansions

/// Space expansions that can be requested from the Twitter API v2
public enum TwitterSpaceExpansionsV2: String, TwitterExpansionsV2, Sendable {
    case creatorID = "creator_id"
    case hostIDs = "host_ids"
    case invitedUserIDs = "invited_user_ids"
    case speakerIDs = "speaker_ids"
    case topicIDs = "topic_ids"

    public var stringValue: String { rawValue }

    public static let all: Set<TwitterSpaceExpansionsV2> = [
        .hostIDs,
        .creatorID,
        .invitedUserIDs,
        .speakerIDs,
        .topicIDs
    ]
}

// MARK: - DM Event Expansions

/// DM event expansions that can be requested from the Twitter API v2
public enum TwitterDmEventExpansionsV2: String, TwitterExpansionsV2, Sendable {
    case attachmentsMediaKeys = "attachments.media_keys"
    case participantIDs = "participant_ids"
    case referencedTweetsID = "referenced_tweets.id"
    case senderID = "sender_id"

    public var stringValue: String { rawValue }

    public static let all: Set<TwitterDmEventExpansionsV2> = [
        .attachmentsMediaKeys,
        .referencedTweetsID,
        .senderID,
        .participantIDs
    ]
}
