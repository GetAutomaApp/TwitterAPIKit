// TweetAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct TweetAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
    /// post-and-engage/api-reference/post-statuses-update
    public func postUpdateStatus(
        _ request: PostStatusesUpdateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
    /// post-and-engage/api-reference/post-statuses-destroy-id
    public func postDestroyStatus(
        _ request: PostStatusesDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
    /// post-and-engage/api-reference/get-statuses-show-id
    public func getShowStatus(
        _ request: GetStatusesShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
    /// post-and-engage/api-reference/get-statuses-lookup
    public func getLookupStatuses(
        _ request: GetStatusesLookupRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
