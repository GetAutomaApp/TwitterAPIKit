// TimelineAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/overview
open class TimelineAPIv1: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-home_timeline
    public func getHomeTimeline(
        _ request: GetStatusesHomeTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
    /// api-reference/get-statuses-mentions_timeline
    public func getMentionsTimeline(
        _ request: GetStatusesMentionsTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-user_timeline
    public func getUserTimeline(
        _ request: GetStatusesUserTimelineRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
