// GetUsersRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users
open class GetUsersRequestV2: TwitterAPIRequest {
    public let ids: [String]
    public let expansions: Set<TwitterUserExpansionsV2>?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/users"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["ids"] = ids.joined(separator: ",")
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        ids: [String],
        expansions: Set<TwitterUserExpansionsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.ids = ids
        self.expansions = expansions
        self.tweetFields = tweetFields
        self.userFields = userFields
    }

    deinit {
        // de-init logic here
    }
}
