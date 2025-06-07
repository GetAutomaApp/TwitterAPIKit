// PostFriendshipsCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/post-friendships-create
public struct PostFriendshipsCreateRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let follow: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/friendships/create.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        follow.map { params["follow"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        follow: Bool? = .none
    ) {
        self.user = user
        self.follow = follow
    }

}
