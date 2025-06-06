// PostOAuth2InvalidateTokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/invalidate_bearer_token
open class PostOAuth2InvalidateTokenRequestV1: TwitterAPIRequest {
    public let accessToken: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/oauth2/invalidate_token"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["access_token"] = accessToken
        return params
    }

    public init(
        accessToken: String
    ) {
        self.accessToken = accessToken
    }

    deinit {
        // De-init Logic Here
    }
}
