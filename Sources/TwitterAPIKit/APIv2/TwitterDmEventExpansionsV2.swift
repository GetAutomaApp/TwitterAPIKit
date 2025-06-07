// TwitterDmEventExpansionsV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/expansions
public protocol TwitterExpansionsParameterV2: TwitterAPIv2RequestParameter {}

/// Binds the expansions to the request parameters.
public extension Set where Element: TwitterExpansionsParameterV2 {
    /// Binds the expansions to the request parameters.
    func bind(param: inout [String: Any]) {
        param["expansions"] = commaSeparatedString
    }
}

public enum TwitterTweetExpansionsV2: TwitterExpansionsParameterV2, Hashable, Sendable {
    case attachmentsMediaKeys
    case attachmentsPollIDs
    case authorID
    case entitiesMentionsUsername
    case geoPlaceID
    case inReplyToUserID
    case other(String)
    case referencedTweetsID
    case referencedTweetsIDAuthorID

    public var stringValue: String {
        switch self {
        case .attachmentsMediaKeys: "attachments.media_keys"
        case .attachmentsPollIDs: "attachments.poll_ids"
        case .authorID: "author_id"
        case .entitiesMentionsUsername: "entities.mentions.username"
        case .geoPlaceID: "geo.place_id"
        case .inReplyToUserID: "in_reply_to_user_id"
        case let .other(string): string
        case .referencedTweetsID: "referenced_tweets.id"
        case .referencedTweetsIDAuthorID: "referenced_tweets.id.author_id"
        }
    }

    public static let all: Set<Self> = [
        .attachmentsMediaKeys,
        .attachmentsPollIDs,
        .authorID,
        .entitiesMentionsUsername,
        .geoPlaceID,
        .inReplyToUserID,
        .referencedTweetsID,
        .referencedTweetsIDAuthorID,
    ]
}

public enum TwitterUserExpansionsV2: TwitterExpansionsParameterV2, Hashable {
    case other(String)
    case pinnedTweetID

    public var stringValue: String {
        switch self {
        case let .other(string): string
        case .pinnedTweetID: "pinned_tweet_id"
        }
    }

    public static let all: Set<Self> = [
        .pinnedTweetID,
    ]
}

public enum TwitterListExpansionsV2: TwitterExpansionsParameterV2, Hashable {
    case other(String)
    case ownerID

    public var stringValue: String {
        switch self {
        case let .other(string): string
        case .ownerID: "owner_id"
        }
    }

    public static let all: Set<Self> = [
        .ownerID,
    ]
}

public enum TwitterSpaceExpansionsV2: TwitterExpansionsParameterV2, Hashable {
    case creatorID
    case hostIDs
    case invitedUserIDs
    case other(String)
    case speakerIDs
    case topicIDs

    public var stringValue: String {
        switch self {
        case .creatorID: "creator_id"
        case .hostIDs: "host_ids"
        case .invitedUserIDs: "invited_user_ids"
        case let .other(string): string
        case .speakerIDs: "speaker_ids"
        case .topicIDs: "topic_ids"
        }
    }

    public static let all: Set<Self> = [
        .creatorID,
        .hostIDs,
        .invitedUserIDs,
        .speakerIDs,
        .topicIDs,
    ]
}

/// A comma separated list of fields to expand.
/// expansions
public enum TwitterDmEventExpansionsV2: TwitterExpansionsParameterV2, Hashable {
    case attachmentsMediaKeys
    case other(String)
    case participantIDs
    case referencedTweetsID
    case senderID

    public var stringValue: String {
        switch self {
        case .attachmentsMediaKeys: "attachments.media_keys"
        case let .other(string): string
        case .participantIDs: "participant_ids"
        case .referencedTweetsID: "referenced_tweets.id"
        case .senderID: "sender_id"
        }
    }

    public static let all: Set<Self> = [
        .attachmentsMediaKeys,
        .participantIDs,
        .referencedTweetsID,
        .senderID,
    ]
}
