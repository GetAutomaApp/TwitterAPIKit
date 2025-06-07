// TwitterAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

// https://developer.twitter.com/en/docs/api-reference-index

/// Main class for interacting with Twitter API v2 endpoints.
/// This class provides access to various API modules for different Twitter functionalities.
/// Each property represents a specialized API client for specific Twitter features.
public struct TwitterAPIv2: Sendable {
    /// Client for managing block and mute relationships between users.
    public let blockAndMute: BlockAndMuteAPIv2

    /// Client for managing tweet bookmarks.
    public let bookmarks: BookmarksAPIv2

    /// Client for accessing Twitter's compliance and data management endpoints.
    public let compliance: ComplianceAPIv2

    /// Client for managing follow relationships between users.
    public let friendships: FriendshipsAPIv2

    /// Client for managing tweet likes (favorites).
    public let like: LikeAPIv2

    /// Client for managing Twitter lists.
    public let list: ListAPIv2

    /// Client for managing retweets.
    public let retweet: RetweetAPIv2

    /// Client for searching tweets.
    public let search: SearchAPIv2

    /// Client for managing Twitter Spaces.
    public let spaces: SpacesAPIv2

    /// Client for accessing Twitter's streaming endpoints.
    public let stream: StreamAPIv2

    /// Client for accessing user timelines.
    public let timeline: TimelineAPIv2

    /// Client for managing tweets.
    public let tweet: TweetAPIv2

    /// Client for retrieving tweet counts and metrics.
    public let tweetCount: TweetCountAPIv2

    /// Client for managing user profiles and information.
    public let user: UserAPIv2

    /// Client for managing direct messages.
    public let dm: DirectMessageAPIv2

    /// Initializes a new TwitterAPIv2 instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        blockAndMute = .init(session: session)
        bookmarks = .init(session: session)
        compliance = .init(session: session)
        friendships = .init(session: session)
        like = .init(session: session)
        list = .init(session: session)
        retweet = .init(session: session)
        search = .init(session: session)
        spaces = .init(session: session)
        stream = .init(session: session)
        timeline = .init(session: session)
        tweet = .init(session: session)
        tweetCount = .init(session: session)
        user = .init(session: session)
        dm = .init(session: session)
    }

}

/// Protocol defining parameters that can be used in Twitter API v2 requests.
public protocol TwitterAPIv2RequestParameter: Sendable {
    /// The string representation of the parameter value.
    var stringValue: String { get }
}

public extension Collection where Element: TwitterAPIv2RequestParameter {
    /// Joins multiple parameter values into a comma-separated string.
    var commaSeparatedString: String {
        map(\.stringValue).sorted().joined(separator: ",")
    }
}
