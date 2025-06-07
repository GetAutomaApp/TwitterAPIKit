// GetTweetsLikingUsersRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-tweets-id-liking_users
public struct GetTweetsLikingUsersRequestV2: TwitterAPIRequest {
    /// Tweet ID
    public let id: String
    public let expansions: Set<TwitterUserExpansionsV2>?
    public let maxResults: Int?
    public let mediaFields: Set<TwitterMediaFieldsV2>?
    public let paginationToken: String?
    public let placeFields: Set<TwitterPlaceFieldsV2>?
    public let pollFields: Set<TwitterPollFieldsV2>?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/tweets/\(id)/liking_users"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        expansions?.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        mediaFields?.bind(param: &params)
        paginationToken.map { params["pagination_token"] = $0 }
        placeFields?.bind(param: &params)
        pollFields?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        expansions: Set<TwitterUserExpansionsV2>? = .none,
        maxResults: Int? = .none,
        mediaFields: Set<TwitterMediaFieldsV2>? = .none,
        paginationToken: String? = .none,
        placeFields: Set<TwitterPlaceFieldsV2>? = .none,
        pollFields: Set<TwitterPollFieldsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.maxResults = maxResults
        self.mediaFields = mediaFields
        self.paginationToken = paginationToken
        self.placeFields = placeFields
        self.pollFields = pollFields
        self.tweetFields = tweetFields
        self.userFields = userFields
    }

}
