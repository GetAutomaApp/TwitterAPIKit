// GetTweetsSearchRecentRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent
public struct GetTweetsSearchRecentRequestV2: TwitterAPIRequest {
    public enum TwitterSearchTweetsSortOrderV2: String, Sendable {
        case recency
        case relevancy

        public func bind(param: inout [String: Any]) {
            param["sort_order"] = rawValue
        }
    }

    public let query: String
    public let endTime: Date?
    public let expansions: Set<TwitterTweetExpansionsV2>?
    public let maxResults: Int?
    public let mediaFields: Set<TwitterMediaFieldsV2>?
    public let nextToken: String?
    public let placeFields: Set<TwitterPlaceFieldsV2>?
    public let pollFields: Set<TwitterPollFieldsV2>?
    public let sinceID: String?
    public let sortOrder: TwitterSearchTweetsSortOrderV2?
    public let startTime: Date?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let untilID: String?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/tweets/search/recent"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["query"] = query
        endTime?.bind(param: &params, for: "end_time")
        expansions?.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        mediaFields?.bind(param: &params)
        nextToken.map { params["next_token"] = $0 }
        placeFields?.bind(param: &params)
        pollFields?.bind(param: &params)
        sinceID.map { params["since_id"] = $0 }
        sortOrder?.bind(param: &params)
        startTime?.bind(param: &params, for: "start_time")
        tweetFields?.bind(param: &params)
        untilID.map { params["until_id"] = $0 }
        userFields?.bind(param: &params)
        return params
    }

    public init(
        query: String,
        endTime: Date? = .none,
        expansions: Set<TwitterTweetExpansionsV2>? = .none,
        maxResults: Int? = .none,
        mediaFields: Set<TwitterMediaFieldsV2>? = .none,
        nextToken: String? = .none,
        placeFields: Set<TwitterPlaceFieldsV2>? = .none,
        pollFields: Set<TwitterPollFieldsV2>? = .none,
        sinceID: String? = .none,
        sortOrder: TwitterSearchTweetsSortOrderV2? = .none,
        startTime: Date? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        untilID: String? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.query = query
        self.endTime = endTime
        self.expansions = expansions
        self.maxResults = maxResults
        self.mediaFields = mediaFields
        self.nextToken = nextToken
        self.placeFields = placeFields
        self.pollFields = pollFields
        self.sinceID = sinceID
        self.sortOrder = sortOrder
        self.startTime = startTime
        self.tweetFields = tweetFields
        self.untilID = untilID
        self.userFields = userFields
    }

}
