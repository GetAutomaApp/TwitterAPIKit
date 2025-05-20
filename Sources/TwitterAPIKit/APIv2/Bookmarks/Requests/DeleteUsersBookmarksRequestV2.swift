// DeleteUsersBookmarksRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/delete-users-id-bookmarks-tweet_id
open class DeleteUsersBookmarksRequestV2: TwitterAPIRequest {
    /// The user ID of an authenticated user who you are removing a Bookmark of a Tweet on behalf of. It must match your
    /// own user ID or that of an authenticating user, meaning that you must pass the Access Tokens associated with the
    /// user ID when authenticating your request.
    public let id: String
    public let tweetID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/users/\(id)/bookmarks/\(tweetID)"
    }

    open var parameters: [String: Any] {
        [:]
    }

    public init(
        id: String,
        tweetID: String
    ) {
        self.id = id
        self.tweetID = tweetID
    }

    deinit {
        // de-init logic here
    }
}
