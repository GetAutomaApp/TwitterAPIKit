// PostMutesUsersCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-create
open class PostMutesUsersCreateRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/mutes/users/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        return params
    }

    public init(
        user: TwitterUserIdentifierV1
    ) {
        self.user = user
    }
    deinit {
        // de-init logic here
    }
}
