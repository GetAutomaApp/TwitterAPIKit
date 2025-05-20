// PostSavedSearchesDestroyRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/post-saved_searches-destroy-id
open class PostSavedSearchesDestroyRequestV1: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/saved_searches/destroy/\(id).json"
    }

    open var parameters: [String: Any] {
        [:]
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
