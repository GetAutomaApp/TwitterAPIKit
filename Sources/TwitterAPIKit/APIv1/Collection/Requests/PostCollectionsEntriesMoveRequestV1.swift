// PostCollectionsEntriesMoveRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// curate-a-collection/api-reference/post-collections-entries-move
open class PostCollectionsEntriesMoveRequestV1: TwitterAPIRequest {
    public let id: String
    public let tweetID: String
    public let above: Bool?
    public let relativeTo: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/collections/entries/move.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        params["tweet_id"] = tweetID
        above.map { params["above"] = $0 }
        params["relative_to"] = relativeTo
        return params
    }

    public init(
        id: String,
        tweetID: String,
        above: Bool? = .none,
        relativeTo: String
    ) {
        self.id = id
        self.tweetID = tweetID
        self.above = above
        self.relativeTo = relativeTo
    }

    deinit {
        // de-init logic here
    }
}
