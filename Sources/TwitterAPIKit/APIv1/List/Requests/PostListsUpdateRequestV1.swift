// PostListsUpdateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/post-lists-update
public struct PostListsUpdateRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let name: String?
    public let mode: TwitterListModeV1?
    public let description: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/lists/update.json"
    }

    public var parameters: [String: Any] {
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

}
