// DeleteUsersFollowingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/delete-users-source_id-following
open class DeleteUsersFollowingRequestV2: TwitterAPIRequest {
    public let sourceUserID: String
    public let targetUserID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/users/\(sourceUserID)/following/\(targetUserID)"
    }

    open var parameters: [String: Any] {
        [:]
    }

    public init(
        sourceUserID: String,
        targetUserID: String
    ) {
        self.sourceUserID = sourceUserID
        self.targetUserID = targetUserID
    }

    deinit {
        // de-init logic here
    }
}
