// PostOAuthInvalidateTokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/invalidate_access_token
public struct PostOAuthInvalidateTokenRequestV1: TwitterAPIRequest {
    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/oauth/invalidate_token"
    }

    public var parameters: [String: Any] {
        [:]
    }

    public init() {}

}
