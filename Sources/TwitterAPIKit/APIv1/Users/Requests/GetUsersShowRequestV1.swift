// GetUsersShowRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-users-show
open class GetUsersShowRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/users/show.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        includeEntities: Bool? = .none
    ) {
        self.user = user
        self.includeEntities = includeEntities
    }

    deinit {
        // De-init Logic Here
    }
}
