// GetFollowersListRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-followers-list
open class GetFollowersListRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let count: Int?
    public let cursor: String?
    public let skipStatus: Bool?
    public let includeUserEntities: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/followers/list.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        includeUserEntities.map { params["include_user_entities"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none,
        skipStatus: Bool? = .none,
        includeUserEntities: Bool? = .none
    ) {
        self.user = user
        self.count = count
        self.cursor = cursor
        self.skipStatus = skipStatus
        self.includeUserEntities = includeUserEntities
    }

    deinit {
        // de-init logic here
    }
}
