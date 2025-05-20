// GetRetweetsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets-id
open class GetRetweetsRequestV1: TwitterAPIRequest {
    /// Status ID
    public let id: String
    /// max: 100
    public let count: Int?
    public let trimUser: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/statuses/retweets/\(id).json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        count.map { params["count"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        return params
    }

    public init(
        id: String,
        count: Int? = .none,
        trimUser: Bool? = .none
    ) {
        self.id = id
        self.count = count
        self.trimUser = trimUser
    }

    deinit {
        // de-init logic here
    }
}
