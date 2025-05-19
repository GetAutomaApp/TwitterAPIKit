// PostListsDestroyRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/post-lists-destroy
open class PostListsDestroyRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/lists/destroy.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        return params
    }

    public init(
        list: TwitterListIdentifierV1
    ) {
        self.list = list
    }

    deinit {
        // De-init Logic Here
    }
}
