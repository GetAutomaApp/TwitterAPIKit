// PostCollectionsDestroyRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// curate-a-collection/api-reference/post-collections-destroy
open class PostCollectionsDestroyRequestV1: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/collections/destroy.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        return params
    }

    public init(
        id: String
    ) {
        self.id = id
    }

    deinit {
        // de-init logic here
    }
}
