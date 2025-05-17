// GetUsersLookupRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup
open class GetUsersLookupRequestV1: TwitterAPIRequest {
    public let users: TwitterUsersIdentifierV1
    public let tweetMode: Bool?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/users/lookup.json"
    }

    open var parameters: [String: Any] {
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

    deinit {
        // De-init Logic Here
    }
}
