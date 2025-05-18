// PostListsCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/post-lists-create
open class PostListsCreateRequestV1: TwitterAPIRequest {
    public let name: String
    public let mode: TwitterListModeV1?
    public let description: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/lists/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["name"] = name
        mode?.bind(param: &params)
        description.map { params["description"] = $0 }
        return params
    }

    public init(
        name: String,
        mode: TwitterListModeV1? = .none,
        description: String? = .none
    ) {
        self.name = name
        self.mode = mode
        self.description = description
    }

    deinit {
        // De-init Logic Here
    }
}
