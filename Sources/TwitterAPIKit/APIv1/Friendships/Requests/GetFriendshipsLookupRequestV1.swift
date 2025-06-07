// GetFriendshipsLookupRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-friendships-lookup
public struct GetFriendshipsLookupRequestV1: TwitterAPIRequest {
    public let users: TwitterUsersIdentifierV1

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/friendships/lookup.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        users.bind(param: &params)
        return params
    }

    public init(
        users: TwitterUsersIdentifierV1
    ) {
        self.users = users
    }

}
