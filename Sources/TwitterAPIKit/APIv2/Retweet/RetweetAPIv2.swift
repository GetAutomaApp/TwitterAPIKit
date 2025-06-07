// RetweetAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct RetweetAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/
    /// api-reference/get-tweets-id-retweeted_by
    public func getRetweetedBy(
        _ request: GetTweetsRetweetedByRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/
    /// api-reference/post-users-id-retweets
    public func postRetweet(
        _ request: PostUsersRetweetsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/
    /// api-reference/delete-users-id-retweets-tweet_id
    public func deleteRetweet(
        _ request: DeleteUsersRetweetsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
