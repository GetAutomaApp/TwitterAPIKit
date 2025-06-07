// TimelineAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/overview
/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
/// overview
public struct TimelineAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-home_timeline
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
    /// api-reference/get-statuses-home_timeline
    public func getHomeTimeline(
        _ request: GetStatusesHomeTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
    /// overview
    /// api-reference/get-statuses-mentions_timeline
    public func getMentionsTimeline(
        _ request: GetStatusesMentionsTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
    /// api-reference/get-statuses-user_timeline
    public func getUserTimeline(
        _ request: GetStatusesUserTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
