// GetListsStatusesRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses
open class GetListsStatusesRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let count: Int?
    public let sinceID: String?
    public let maxID: String?
    public let includeEntities: Bool?
    public let includeRTs: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/lists/statuses.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        count.map { params["count"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        maxID.map { params["max_id"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        includeRTs.map { params["include_rts"] = $0 }
        return params
    }

    public init(
        list: TwitterListIdentifierV1,
        count: Int? = .none,
        sinceID: String? = .none,
        maxID: String? = .none,
        includeEntities: Bool? = .none,
        includeRTs: Bool? = .none
    ) {
        self.list = list
        self.count = count
        self.sinceID = sinceID
        self.maxID = maxID
        self.includeEntities = includeEntities
        self.includeRTs = includeRTs
    }

    deinit {
        // De-init Logic Here
    }
}
