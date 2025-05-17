// PostSavedSearchesCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create
open class PostSavedSearchesCreateRequestV1: TwitterAPIRequest {
    public let query: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/saved_searches/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["query"] = query
        return params
    }

    public init(
        query: String
    ) {
        self.query = query
    }

    deinit {
        // De-init Logic Here
    }
}
