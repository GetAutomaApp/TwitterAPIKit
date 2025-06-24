// GetTweetsRetweetedByRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request retrieves a list of users who have retweeted a specific tweet.
/// The response includes user objects with their profile information.
/// Note: This endpoint requires OAuth 1.0a User Context authentication.
public struct GetTweetsRetweetedByRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterUsersResponseV2

    public let method: HTTPMethod = .get
    public let path: String
    public let parameters: [String: Any]

    public init(
        tweetId: String,
        expansions: Set<TwitterUserExpansionsV2>? = nil,
        maxResults: Int? = nil,
        paginationToken: String? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        path = "/2/tweets/\(tweetId)/retweeted_by"

        var params: [String: Any] = [:]
        if let expansions {
            params["expansions"] = expansions.map(\.stringValue).joined(separator: ",")
        }
        if let maxResults {
            params["max_results"] = maxResults
        }
        if let paginationToken {
            params["pagination_token"] = paginationToken
        }
        if let tweetFields {
            params["tweet.fields"] = tweetFields.map(\.stringValue).joined(separator: ",")
        }
        if let userFields {
            params["user.fields"] = userFields.map(\.stringValue).joined(separator: ",")
        }

        parameters = params
    }
}
