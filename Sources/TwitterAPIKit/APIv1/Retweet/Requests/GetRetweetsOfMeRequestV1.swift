// GetRetweetsOfMeRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets_of_me
open class GetRetweetsOfMeRequestV1: TwitterAPIRequest {
    public let count: Int?
    public let sinceID: String?
    public let maxID: String?
    public let trimUser: Bool?
    public let includeEntities: Bool?
    public let includeUserEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/statuses/retweets_of_me.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()

        count.map { params["count"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        maxID.map { params["max_id"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        includeUserEntities.map { params["include_user_entities"] = $0 }

        return params
    }

    public init(
        count: Int? = .none,
        sinceID: String? = .none,
        maxID: String? = .none,
        trimUser: Bool? = .none,
        includeEntities: Bool? = .none,
        includeUserEntities: Bool? = .none
    ) {
        self.count = count
        self.sinceID = sinceID
        self.maxID = maxID
        self.trimUser = trimUser
        self.includeEntities = includeEntities
        self.includeUserEntities = includeUserEntities
    }
}
