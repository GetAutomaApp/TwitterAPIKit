// DeleteTweetRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/delete-tweets-id
open class DeleteTweetRequestV2: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/tweets/\(id)"
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
