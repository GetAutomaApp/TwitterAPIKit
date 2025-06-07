// GetUsersLookupRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-users-lookup
public struct GetUsersLookupRequestV1: TwitterAPIRequest {
    public let users: TwitterUsersIdentifierV1
    public let tweetMode: Bool?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/users/lookup.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        users.bind(param: &params)
        tweetMode.map { params["tweet_mode"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        users: TwitterUsersIdentifierV1,
        tweetMode: Bool? = .none,
        includeEntities: Bool? = .none
    ) {
        self.users = users
        self.tweetMode = tweetMode
        self.includeEntities = includeEntities
    }

}
