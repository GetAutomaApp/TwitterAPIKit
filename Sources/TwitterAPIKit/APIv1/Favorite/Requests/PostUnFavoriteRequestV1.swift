// PostUnFavoriteRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
open class PostUnFavoriteRequestV1: TwitterAPIRequest {
    public let id: String
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/favorites/destroy.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        id: String,
        includeEntities: Bool? = .none
    ) {
        self.id = id
        self.includeEntities = includeEntities
    }
    deinit {
        // de-init logic here
    }
}
