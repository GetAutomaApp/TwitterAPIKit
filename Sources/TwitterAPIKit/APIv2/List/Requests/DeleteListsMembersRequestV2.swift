// DeleteListsMembersRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/delete-lists-id-members-user_id
public struct DeleteListsMembersRequestV2: TwitterAPIRequest {
    public let id: String
    public let userID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/lists/\(id)/members/\(userID)"
    }

    public var parameters: [String: Any] {
        [:]
    }

    public init(
        id: String,
        userID: String
    ) {
        self.id = id
        self.userID = userID
    }

}
