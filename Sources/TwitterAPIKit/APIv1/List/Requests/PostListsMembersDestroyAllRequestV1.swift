// PostListsMembersDestroyAllRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/post-lists-members-destroy_all
public struct PostListsMembersDestroyAllRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let users: TwitterUsersIdentifierV1

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/lists/members/destroy_all.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        users.bind(param: &params)
        return params
    }

    public init(
        list: TwitterListIdentifierV1,
        users: TwitterUsersIdentifierV1
    ) {
        self.list = list
        self.users = users
    }

}
