// GetUsersMutingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/get-users-muting
open class GetUsersMutingRequestV2: TwitterAPIRequest {
    public let id: String
    public let expansions: Set<TwitterUserExpansionsV2>?
    public let maxResults: Int?
    public let paginationToken: String?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/users/\(id)/muting"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        expansions?.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        paginationToken.map { params["pagination_token"] = $0 }
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        expansions: Set<TwitterUserExpansionsV2>? = .none,
        maxResults: Int? = .none,
        paginationToken: String? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.maxResults = maxResults
        self.paginationToken = paginationToken
        self.tweetFields = tweetFields
        self.userFields = userFields
    }
    deinit {
        // de-init logic here
    }
}
