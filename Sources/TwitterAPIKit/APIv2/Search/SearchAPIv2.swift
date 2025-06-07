// SearchAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct SearchAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent
    public func searchTweetsRecent(
        _ request: GetTweetsSearchRecentRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-all
    /// - Important: This endpoint is only available to those users who have been approved for Academic Research access.
    public func searchTweetsAll(
        _ request: GetTweetsSearchAllRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
