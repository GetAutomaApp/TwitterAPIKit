// PostOAuth2TokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/token
public struct PostOAuth2TokenRequestV1: TwitterAPIRequest {
    public let grantType: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/oauth2/token"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["grant_type"] = grantType
        return params
    }

    public init(
        grantType: String = "client_credentials"
    ) {
        self.grantType = grantType
    }

}
