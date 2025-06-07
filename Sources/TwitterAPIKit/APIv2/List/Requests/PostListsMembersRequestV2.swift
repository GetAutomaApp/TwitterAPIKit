// PostListsMembersRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/post-lists-id-members
public struct PostListsMembersRequestV2: TwitterAPIRequest {
    public let id: String
    public let userID: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/lists/\(id)/members"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["user_id"] = userID
        return params
    }

    public init(
        id: String,
        userID: String
    ) {
        self.id = id
        self.userID = userID
    }

}
