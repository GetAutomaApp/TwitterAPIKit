// GetTweetsCountsAllRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-all
public struct GetTweetsCountsAllRequestV2: TwitterAPIRequest {
    public let query: String
    public let endTime: Date?
    public let granularity: TweetCountGranularityV2?
    public let nextToken: String?
    public let sinceID: String?
    public let startTime: Date?
    public let untilID: String?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/tweets/counts/all"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["query"] = query
        endTime?.bind(param: &params, for: "end_time")
        granularity?.bind(param: &params)
        nextToken.map { params["next_token"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        startTime?.bind(param: &params, for: "start_time")
        untilID.map { params["until_id"] = $0 }
        return params
    }

    public init(
        query: String,
        endTime: Date? = .none,
        granularity: TweetCountGranularityV2? = .none,
        nextToken: String? = .none,
        sinceID: String? = .none,
        startTime: Date? = .none,
        untilID: String? = .none
    ) {
        self.query = query
        self.endTime = endTime
        self.granularity = granularity
        self.nextToken = nextToken
        self.sinceID = sinceID
        self.startTime = startTime
        self.untilID = untilID
    }

}
