// TimelineAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct TimelineAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/
    /// api-reference/get-users-id-tweets
    public func getUserTweets(
        _ request: GetUsersTweetsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/
    /// api-reference/get-users-id-mentions
    public func getUserMensions(
        _ request: GetUsersMentionsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// a.k.a Home Timeline
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/
    /// api-reference/get-users-id-reverse-chronological
    public func getUserReverseChronological(
        _ request: GetUsersTimelinesReverseChronologicalRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
