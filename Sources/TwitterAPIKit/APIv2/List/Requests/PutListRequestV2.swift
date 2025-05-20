// PutListRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/put-lists-id
open class PutListRequestV2: TwitterAPIRequest {
    public let id: String
    public let description: String?
    public let name: String?
    public let `private`: Bool?

    public var method: HTTPMethod {
        .put
    }

    public var path: String {
        "/2/lists/\(id)"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        description.map { params["description"] = $0 }
        name.map { params["name"] = $0 }
        `private`.map { params["private"] = $0 }
        return params
    }

    public init(
        id: String,
        description: String? = .none,
        name: String? = .none,
        private: Bool? = .none
    ) {
        self.id = id
        self.description = description
        self.name = name
        self.private = `private`
    }

    deinit {
        // de-init logic here
    }
}
