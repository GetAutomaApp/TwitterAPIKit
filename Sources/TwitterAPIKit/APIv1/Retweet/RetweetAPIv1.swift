// RetweetAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class RetweetAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/post-statuses-retweet-id
    public func postRetweet(
        _ request: PostRetweetRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/post-statuses-unretweet-id
    public func postUnRetweet(
        _ request: PostUnRetweetRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweets-id
    public func getRetweets(
        _ request: GetRetweetsRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweets_of_me
    public func getRetweetsOfMe(
        _ request: GetRetweetsOfMeRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/
    /// api-reference/get-statuses-retweeters-ids
    public func getRetweeters(
        _ request: GetRetweetersRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
