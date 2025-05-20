// PostUsersBlockingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/post-users-user_id-blocking
open class PostUsersBlockingRequestV2: TwitterAPIRequest {
    public let id: String
    public let targetUserID: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/users/\(id)/blocking"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["target_user_id"] = targetUserID
        return params
    }

    public init(
        id: String,
        targetUserID: String
    ) {
        self.id = id
        self.targetUserID = targetUserID
    }

    deinit {
        // de-init logic here
    }
}
