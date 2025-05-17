// GetCollectionsShowRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-show
open class GetCollectionsShowRequestV1: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/collections/show.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        return params
    }

    public init(
        id: String
    ) {
        self.id = id
    }
}
