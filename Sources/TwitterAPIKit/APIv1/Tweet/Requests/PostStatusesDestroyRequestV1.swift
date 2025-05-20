// PostStatusesDestroyRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
open class PostStatusesDestroyRequestV1: TwitterAPIRequest {
    public let id: String
    public let trimUser: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/statuses/destroy/\(id).json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        trimUser.map { params["trim_user"] = $0 }
        return params
    }

    public init(
        id: String,
        trimUser: Bool? = .none
    ) {
        self.id = id
        self.trimUser = trimUser
    }

    deinit {
        // de-init logic here
    }
}
