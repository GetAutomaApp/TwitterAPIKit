// GetUsersByRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by
open class GetUsersByRequestV2: TwitterAPIRequest {
    public let usernames: [String]
    public let expansions: Set<TwitterUserExpansionsV2>?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/users/by"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["usernames"] = usernames.joined(separator: ",")
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        usernames: [String],
        expansions: Set<TwitterUserExpansionsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.usernames = usernames
        self.expansions = expansions
        self.tweetFields = tweetFields
        self.userFields = userFields
    }

    deinit {
        // de-init logic here
    }
}
