// PostMutesUsersDestroyRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
/// api-reference/post-mutes-users-destroy
open class PostMutesUsersDestroyRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/mutes/users/destroy.json"
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
