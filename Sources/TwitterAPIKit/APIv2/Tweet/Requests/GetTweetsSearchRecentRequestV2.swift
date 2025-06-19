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
        
        if let endTime = endTime {
            params["end_time"] = ISO8601DateFormatter().string(from: endTime)
        }
        
        if let expansions = expansions {
            params["expansions"] = expansions.map { $0.stringValue }.joined(separator: ",")
        }
        
        if let maxResults = maxResults {
            params["max_results"] = maxResults
        }
        
        if let mediaFields = mediaFields {
            params["media.fields"] = mediaFields.map { $0.stringValue }.joined(separator: ",")
        }
        
        if let nextToken = nextToken {
            params["next_token"] = nextToken
        }
        
        if let placeFields = placeFields {
            params["place.fields"] = placeFields.map { $0.stringValue }.joined(separator: ",")
        }
        
        if let pollFields = pollFields {
            params["poll.fields"] = pollFields.map { $0.stringValue }.joined(separator: ",")
        }
        
        if let sinceID = sinceID {
            params["since_id"] = sinceID
        }
        
        if let sortOrder = sortOrder {
            params["sort_order"] = sortOrder.rawValue
        }
        
        if let startTime = startTime {
            params["start_time"] = ISO8601DateFormatter().string(from: startTime)
        }
        
        if let tweetFields = tweetFields {
            params["tweet.fields"] = tweetFields.map { $0.stringValue }.joined(separator: ",")
        }
        
        if let untilID = untilID {
            params["until_id"] = untilID
        }
        
        if let userFields = userFields {
            params["user.fields"] = userFields.map { $0.stringValue }.joined(separator: ",")
        }
        
        self.parameters = params
    }
} 