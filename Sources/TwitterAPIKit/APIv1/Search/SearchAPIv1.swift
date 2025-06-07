// SearchAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct SearchAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }
    
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/
    /// api-reference/get-search-tweets
    public func searchTweets(
        _ request: GetSearchTweetsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/get-saved_searches-list
    public func getSavedSearches(
        _ request: GetSavedSearchesListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-saved_searches-create
    public func postCreateSavedSearch(
        _ request: PostSavedSearchesCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-saved_searches-destroy-id
    public func postDestroySavedSearch(
        _ request: PostSavedSearchesCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
