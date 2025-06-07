// GetCollectionsListRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-list
public struct GetCollectionsListRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let count: Int?
    public let cursor: String?
    public let tweetID: String?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/collections/list.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        tweetID.map { params["tweet_id"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none,
        tweetID: String? = .none
    ) {
        self.user = user
        self.count = count
        self.cursor = cursor
        self.tweetID = tweetID
    }

}
