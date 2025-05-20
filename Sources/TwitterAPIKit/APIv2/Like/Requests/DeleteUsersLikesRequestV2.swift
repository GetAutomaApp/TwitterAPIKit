// DeleteUsersLikesRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/delete-users-id-likes-tweet_id
open class DeleteUsersLikesRequestV2: TwitterAPIRequest {
    /// user ID
    public let id: String
    public let tweetID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/users/\(id)/likes/\(tweetID)"
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
