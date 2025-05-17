// GetFavoritesRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
open class GetFavoritesRequestV1: TwitterAPIRequest {
    public let target: TwitterUserIdentifierV1
    public let count: Int?
    public let sinceID: String?
    public let maxID: String?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/favorites/list.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()

        target.bind(param: &params)
        count.map { params["count"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        maxID.map { params["max_id"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }

        return params
    }

    public init(
        target: TwitterUserIdentifierV1,
        count: Int? = .none,
        sinceID: String? = .none,
        maxID: String? = .none,
        includeEntities: Bool? = .none
    ) {
        self.target = target
        self.count = count
        self.sinceID = sinceID
        self.maxID = maxID
        self.includeEntities = includeEntities
    }
    deinit {
        // de-init logic here
    }
}
