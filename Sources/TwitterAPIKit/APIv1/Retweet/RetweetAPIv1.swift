// RetweetAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct RetweetAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/post-statuses-retweet-id
    public func postRetweet(
        _ request: PostRetweetRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/post-statuses-unretweet-id
    public func postUnRetweet(
        _ request: PostUnRetweetRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweets-id
    public func getRetweets(
        _ request: GetRetweetsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweets_of_me
    public func getRetweetsOfMe(
        _ request: GetRetweetsOfMeRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweeters-ids
    public func getRetweeters(
        _ request: GetRetweetersRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
