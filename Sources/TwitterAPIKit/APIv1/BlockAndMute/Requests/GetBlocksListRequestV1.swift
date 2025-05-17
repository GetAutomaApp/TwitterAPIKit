// GetBlocksListRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-list
open class GetBlocksListRequestV1: TwitterAPIRequest {
    public let includeEntities: Bool?
    public let skipStatus: Bool?
    public let cursor: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/blocks/list.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        includeEntities.map { params["include_entities"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        cursor.map { params["cursor"] = $0 }
        return params
    }

    public init(
        includeEntities: Bool? = .none,
        skipStatus: Bool? = .none,
        cursor: String? = .none
    ) {
        self.includeEntities = includeEntities
        self.skipStatus = skipStatus
        self.cursor = cursor
    }
}
