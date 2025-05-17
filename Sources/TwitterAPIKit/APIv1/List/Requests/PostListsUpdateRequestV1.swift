// PostListsUpdateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update
open class PostListsUpdateRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let name: String?
    public let mode: TwitterListModeV1?
    public let description: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/lists/update.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        name.map { params["name"] = $0 }
        mode?.bind(param: &params)
        description.map { params["description"] = $0 }
        return params
    }

    public init(
        list: TwitterListIdentifierV1,
        name: String? = .none,
        mode: TwitterListModeV1? = .none,
        description: String? = .none
    ) {
        self.list = list
        self.name = name
        self.mode = mode
        self.description = description
    }

    deinit {
        // De-init Logic Here
    }
}
