// DeleteUsersRetweetsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/delete-users-id-retweets-tweet_id
open class DeleteUsersRetweetsRequestV2: TwitterAPIRequest {
    public let id: String
    public let sourceTweetID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/users/\(id)/retweets/\(sourceTweetID)"
    }

    open var parameters: [String: Any] {
        [:]
    }

    public init(
        id: String,
        sourceTweetID: String
    ) {
        self.id = id
        self.sourceTweetID = sourceTweetID
    }

    deinit {
        // de-init logic here
    }
}
