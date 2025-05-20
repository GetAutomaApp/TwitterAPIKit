// GetFriendshipsShowRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-friendships-show
open class GetFriendshipsShowRequestV1: TwitterAPIRequest {
    public let sourceUser: TwitterUserIdentifierV1
    public let targetUser: TwitterUserIdentifierV1

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/friendships/show.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        sourceUser.bind(param: &params, userIDKey: "source_id", screenNameKey: "source_screen_name")
        targetUser.bind(param: &params, userIDKey: "target_id", screenNameKey: "target_screen_name")
        return params
    }

    public init(
        sourceUser: TwitterUserIdentifierV1,
        targetUser: TwitterUserIdentifierV1
    ) {
        self.sourceUser = sourceUser
        self.targetUser = targetUser
    }

    deinit {
        // de-init logic here
    }
}
