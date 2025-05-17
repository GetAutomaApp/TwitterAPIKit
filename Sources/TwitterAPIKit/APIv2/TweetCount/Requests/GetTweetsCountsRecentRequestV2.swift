// GetTweetsCountsRecentRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-recent
open class GetTweetsCountsRecentRequestV2: TwitterAPIRequest {
    public let query: String
    public let endTime: Date?
    public let granularity: TweetCountGranularityV2?
    public let sinceID: String?
    public let startTime: Date?
    public let untilID: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/tweets/counts/recent"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["query"] = query
        endTime?.bind(param: &params, for: "end_time")
        granularity?.bind(param: &params)
        sinceID.map { params["since_id"] = $0 }
        startTime?.bind(param: &params, for: "start_time")
        untilID.map { params["until_id"] = $0 }
        return params
    }

    public init(
        query: String,
        endTime: Date? = .none,
        granularity: TweetCountGranularityV2? = .none,
        sinceID: String? = .none,
        startTime: Date? = .none,
        untilID: String? = .none
    ) {
        self.query = query
        self.endTime = endTime
        self.granularity = granularity
        self.sinceID = sinceID
        self.startTime = startTime
        self.untilID = untilID
    }
    deinit {
        // de-init logic here
    }
}
