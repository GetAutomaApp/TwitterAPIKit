// PostBlocksCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-create
open class PostBlocksCreateRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let includeEntities: Bool?
    public let skipStatus: Bool?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/blocks/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        includeEntities.map { params["include_entities"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        includeEntities: Bool? = .none,
        skipStatus: Bool? = .none
    ) {
        self.user = user
        self.includeEntities = includeEntities
        self.skipStatus = skipStatus
    }
    deinit {
        // de-init logic here
    }
}
