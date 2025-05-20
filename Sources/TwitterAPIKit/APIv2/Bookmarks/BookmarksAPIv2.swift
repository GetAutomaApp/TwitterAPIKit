// BookmarksAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class BookmarksAPIv2: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/
    /// api-reference/get-users-id-bookmarks
    public func getBookmarks(
        _ request: GetUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/
    /// api-reference/post-users-id-bookmarks
    public func createBookmark(
        _ request: PostUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/
    /// api-reference/delete-users-id-bookmarks-tweet_id
    public func deleteBookmark(
        _ request: DeleteUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
