// FavoriteAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class FavoriteAPIv1: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-create
    public func postFavorite(
        _ request: PostFavoriteRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
    public func postUnFavorite(
        _ request: PostUnFavoriteRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
    public func getFavorites(
        _ request: GetFavoritesRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
