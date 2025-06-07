// PostUsersFollowingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/post-users-source_user_id-following
public struct PostUsersFollowingRequestV2: TwitterAPIRequest {
    public let id: String
    public let targetUserID: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/users/\(id)/following"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
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

}
