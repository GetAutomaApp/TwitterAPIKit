// GetStatusesHomeTimelineRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/
/// api-reference/get-statuses-home_timeline
open class GetStatusesHomeTimelineRequestV1: TwitterAPIRequest {
    public let count: Int?
    public let maxID: String?
    public let sinceID: String?
    public let trimUser: Bool?
    public let excludeReplies: Bool?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/statuses/home_timeline.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        count.map { params["count"] = $0 }
        maxID.map { params["max_id"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        excludeReplies.map { params["exclude_replies"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        count: Int? = .none,
        maxID: String? = .none,
        sinceID: String? = .none,
        trimUser: Bool? = .none,
        excludeReplies: Bool? = .none,
        includeEntities: Bool? = .none
    ) {
        self.count = count
        self.maxID = maxID
        self.sinceID = sinceID
        self.trimUser = trimUser
        self.excludeReplies = excludeReplies
        self.includeEntities = includeEntities
    }
    deinit {
        // de-init logic here
    }
}
