// PostUnFavoriteRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
public struct PostUnFavoriteRequestV1: TwitterAPIRequest {
    public let id: String
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/favorites/destroy.json"
    }

    public var parameters: [String: Any] {
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

}
