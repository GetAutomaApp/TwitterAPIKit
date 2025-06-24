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
    public typealias Response = TwitterSearchTweetsResponseV2

    public enum TwitterSearchTweetsSortOrderV2: String {
        case recency
        case relevancy
    }

    public let method: HTTPMethod = .get
    public let path: String = "/2/tweets/search/recent"
    public let parameters: [String: Any]

    // swiftlint:disable:next cyclomatic_complexity function_body_length
    public init(
        query: String,
        endTime: Date? = nil,
        expansions: Set<TwitterTweetExpansionsV2>? = nil,
        maxResults: Int? = nil,
        mediaFields: Set<TwitterMediaFieldsV2>? = nil,
        nextToken: String? = nil,
        placeFields: Set<TwitterPlaceFieldsV2>? = nil,
        pollFields: Set<TwitterPollFieldsV2>? = nil,
        sinceID: String? = nil,
        sortOrder: TwitterSearchTweetsSortOrderV2? = nil,
        startTime: Date? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        untilID: String? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        var params: [String: Any] = ["query": query]

        if let endTime {
            params["end_time"] = ISO8601DateFormatter().string(from: endTime)
        }

        if let expansions {
            params["expansions"] = expansions.map(\.stringValue).joined(separator: ",")
        }

        if let maxResults {
            params["max_results"] = maxResults
        }

        if let mediaFields {
            params["media.fields"] = mediaFields.map(\.stringValue).joined(separator: ",")
        }

        if let nextToken {
            params["next_token"] = nextToken
        }

        if let placeFields {
            params["place.fields"] = placeFields.map(\.stringValue).joined(separator: ",")
        }

        if let pollFields {
            params["poll.fields"] = pollFields.map(\.stringValue).joined(separator: ",")
        }

        if let sinceID {
            params["since_id"] = sinceID
        }

        if let sortOrder {
            params["sort_order"] = sortOrder.rawValue
        }

        if let startTime {
            params["start_time"] = ISO8601DateFormatter().string(from: startTime)
        }

        if let tweetFields {
            params["tweet.fields"] = tweetFields.map(\.stringValue).joined(separator: ",")
        }

        if let untilID {
            params["until_id"] = untilID
        }

        if let userFields {
            params["user.fields"] = userFields.map(\.stringValue).joined(separator: ",")
        }

        self.parameters = params
    }
}
