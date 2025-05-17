// PutTweetsHiddenRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/hide-replies/api-reference/put-tweets-id-hidden
open class PutTweetsHiddenRequestV2: TwitterAPIRequest {
    /// Tweet ID
    public let id: String
    public let hidden: Bool

    public var method: HTTPMethod {
        return .put
    }

    public var path: String {
        return "/2/tweets/\(id)/hidden"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["hidden"] = hidden
        return params
    }

    public init(
        id: String,
        hidden: Bool
    ) {
        self.id = id
        self.hidden = hidden
    }
}
