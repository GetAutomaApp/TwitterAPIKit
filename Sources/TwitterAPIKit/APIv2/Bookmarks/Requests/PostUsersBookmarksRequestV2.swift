// PostUsersBookmarksRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/bookmarks/api-reference/post-users-id-bookmarks
open class PostUsersBookmarksRequestV2: TwitterAPIRequest {
    /// The user ID who you are bookmarking a Tweet on behalf of. It must match your own user ID or that of an
    /// authenticating user, meaning that you must pass the Access Token associated with the user ID when authenticating
    /// your request.
    public let id: String
    public let tweetID: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/users/\(id)/bookmarks"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["tweet_id"] = tweetID
        return params
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
