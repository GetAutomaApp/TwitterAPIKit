// ExpansionsV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/expansions
public protocol TwitterExpansionsParameterV2: TwitterAPIv2RequestParameter {}

/// Binds the expansions to the request parameters.
extension Set where Element: TwitterExpansionsParameterV2 {
    /// Binds the expansions to the request parameters.
    public func bind(param: inout [String: Any]) {
        param["expansions"] = commaSeparatedString
    }
}

public enum TwitterTweetExpansionsV2: TwitterExpansionsParameterV2, Hashable {
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
        case .attachmentsMediaKeys: return "attachments.media_keys"
        case .attachmentsPollIDs: return "attachments.poll_ids"
        case .authorID: return "author_id"
        case .entitiesMentionsUsername: return "entities.mentions.username"
        case .geoPlaceID: return "geo.place_id"
        case .inReplyToUserID: return "in_reply_to_user_id"
        case let .other(string): return string
        case .referencedTweetsID: return "referenced_tweets.id"
        case .referencedTweetsIDAuthorID: return "referenced_tweets.id.author_id"
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
        case let .other(string): return string
        case .pinnedTweetID: return "pinned_tweet_id"
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
        case let .other(string): return string
        case .ownerID: return "owner_id"
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
        case .creatorID: return "creator_id"
        case .hostIDs: return "host_ids"
        case .invitedUserIDs: return "invited_user_ids"
        case let .other(string): return string
        case .speakerIDs: return "speaker_ids"
        case .topicIDs: return "topic_ids"
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
        case .attachmentsMediaKeys: return "attachments.media_keys"
        case let .other(string): return string
        case .participantIDs: return "participant_ids"
        case .referencedTweetsID: return "referenced_tweets.id"
        case .senderID: return "sender_id"
        }
    }

    public static let all: Set<Self> = [
        .attachmentsMediaKeys,
        .participantIDs,
        .referencedTweetsID,
        .senderID,
    ]
}
