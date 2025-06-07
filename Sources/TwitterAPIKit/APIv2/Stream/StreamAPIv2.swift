// StreamAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct StreamAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/volume-streams/
    /// api-reference/get-tweets-sample-stream
    public func sampleStream(
        _ request: GetTweetsSampleStreamRequestV2
    ) -> TwitterAPISessionStreamTask {
        session.send(streamRequest: request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/
    /// api-reference/get-tweets-search-stream-rules
    public func getSearchStreamRules(
        _ request: GetTweetsSearchStreamRulesRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/
    /// api-reference/post-tweets-search-stream-rules#Validate
    public func postSearchStreamRules(
        _ request: PostTweetsSearchStreamRulesRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/
    /// api-reference/get-tweets-search-stream
    public func searchStream(
        _ request: GetTweetsSearchStreamRequestV2
    ) -> TwitterAPISessionStreamTask {
        session.send(streamRequest: request)
    }

}
