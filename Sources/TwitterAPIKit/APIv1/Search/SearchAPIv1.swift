// SearchAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class SearchAPIv1: TwitterAPIBase {
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

    deinit {
        // De-init Logic Here
    }
}
