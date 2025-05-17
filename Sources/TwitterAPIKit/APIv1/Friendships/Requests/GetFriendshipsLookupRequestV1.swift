// GetFriendshipsLookupRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup
open class GetFriendshipsLookupRequestV1: TwitterAPIRequest {
    public let users: TwitterUsersIdentifierV1

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/friendships/lookup.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        users.bind(param: &params)
        return params
    }

    public init(
        users: TwitterUsersIdentifierV1
    ) {
        self.users = users
    }
    deinit {
        // de-init logic here
    }
}
