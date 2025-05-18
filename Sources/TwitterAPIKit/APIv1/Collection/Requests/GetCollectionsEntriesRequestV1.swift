// GetCollectionsEntriesRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// curate-a-collection/api-reference/get-collections-entries
open class GetCollectionsEntriesRequestV1: TwitterAPIRequest {
    public let id: String
    public let count: Int?
    public let maxPosition: String?
    public let minPosition: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/collections/entries.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        count.map { params["count"] = $0 }
        maxPosition.map { params["max_position"] = $0 }
        minPosition.map { params["min_position"] = $0 }
        return params
    }

    public init(
        id: String,
        count: Int? = .none,
        maxPosition: String? = .none,
        minPosition: String? = .none
    ) {
        self.id = id
        self.count = count
        self.maxPosition = maxPosition
        self.minPosition = minPosition
    }
    deinit {
        // de-init logic here
    }
}
