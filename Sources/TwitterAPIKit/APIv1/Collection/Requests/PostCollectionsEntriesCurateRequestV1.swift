// PostCollectionsEntriesCurateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// curate-a-collection/api-reference/post-collections-entries-curate
open class PostCollectionsEntriesCurateRequestV1: TwitterAPIRequest {
    public enum Operation {
        case add(tweetID: String)
        case remove(tweetID: String)

        public var keyValue: [String: String] {
            switch self {
            case let .add(tweetID):
                ["op": "add", "tweet_id": tweetID]
            case let .remove(tweetID):
                ["op": "remove", "tweet_id": tweetID]
            }
        }
    }

    public let id: String
    public let changes: [Operation]

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/collections/entries/curate.json"
    }

    public var bodyContentType: BodyContentType {
        .json
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
