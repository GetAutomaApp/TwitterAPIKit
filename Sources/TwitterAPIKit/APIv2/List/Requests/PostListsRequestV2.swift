// PostListsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/post-lists
open class PostListsRequestV2: TwitterAPIRequest {
    public let name: String
    public let description: String?
    public let `private`: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/lists"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["name"] = name
        description.map { params["description"] = $0 }
        `private`.map { params["private"] = $0 }
        return params
    }

    public init(
        name: String,
        description: String? = .none,
        private: Bool? = .none
    ) {
        self.name = name
        self.description = description
        self.private = `private`
    }

    deinit {
        // de-init logic here
    }
}
