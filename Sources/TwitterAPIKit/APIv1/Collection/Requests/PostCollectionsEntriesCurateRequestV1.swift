// PostCollectionsEntriesCurateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-curate
open class PostCollectionsEntriesCurateRequestV1: TwitterAPIRequest {
    public enum Operation {
        case add(tweetID: String)
        case remove(tweetID: String)

        var keyValue: [String: String] {
            switch self {
            case let .add(tweetID):
                return ["op": "add", "tweet_id": tweetID]
            case let .remove(tweetID):
                return ["op": "remove", "tweet_id": tweetID]
            }
        }
    }

    public let id: String
    public let changes: [Operation]

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/collections/entries/curate.json"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        params["changes"] = changes.map(\.keyValue)
        return params
    }

    public init(
        id: String,
        changes: [Operation]
    ) {
        self.id = id
        self.changes = changes
    }
    deinit {
        // de-init logic here
    }
}
