// TweetCountAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct TweetCountAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-recent
    public func getTweetCountRecent(
        _ request: GetTweetsCountsRecentRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-all
    /// - Important: This endpoint is only available to those users who have been approved for Academic Research access.
    public func getTweetCountAll(
        _ request: GetTweetsCountsAllRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
