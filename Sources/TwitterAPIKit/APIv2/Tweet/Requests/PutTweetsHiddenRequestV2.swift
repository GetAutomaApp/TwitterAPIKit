// PutTweetsHiddenRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/hide-replies/api-reference/put-tweets-id-hidden
public struct PutTweetsHiddenRequestV2: TwitterAPIRequest {
    /// Tweet ID
    public let id: String
    public let hidden: Bool

    public var method: HTTPMethod {
        .put
    }

    public var path: String {
        "/2/tweets/\(id)/hidden"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
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
