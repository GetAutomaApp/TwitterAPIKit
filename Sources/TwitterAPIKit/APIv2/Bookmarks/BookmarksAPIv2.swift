// BookmarksAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class BookmarksAPIv2: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/get-users-id-bookmarks
    public func getBookmarks(
        _ request: GetUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/post-users-id-bookmarks
    public func createBookmark(
        _ request: PostUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/delete-users-id-bookmarks-tweet_id
    public func deleteBookmark(
        _ request: DeleteUsersBookmarksRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
