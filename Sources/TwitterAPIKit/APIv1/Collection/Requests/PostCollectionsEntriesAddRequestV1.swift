// PostCollectionsEntriesAddRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-add
open class PostCollectionsEntriesAddRequestV1: TwitterAPIRequest {
    public let id: String
    public let tweetID: String
    public let above: Bool?
    public let relativeTo: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/collections/entries/add.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        params["tweet_id"] = tweetID
        above.map { params["above"] = $0 }
        relativeTo.map { params["relative_to"] = $0 }
        return params
    }

    public init(
        id: String,
        tweetID: String,
        above: Bool? = .none,
        relativeTo: String? = .none
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
