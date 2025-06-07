// PostOAuth2RevokeTokenRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/user-access-token
public struct PostOAuth2RevokeTokenRequestV2: TwitterAPIRequest {
    public let token: String
    /// Required for Public Client.
    public let clientID: String?
    /// Maybe need this parameter when you got
    /// {"error":"invalid_request","error_description":"Missing required parameter [token_type_hint]."}
    /// access_token or refresh_token
    /// > https://datatracker.ietf.org/doc/html/rfc7009#section-2.1
    public let tokenTypeHint: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/oauth2/revoke"
    }

    public var parameters: [String: Any] {
        var params = [String: String]()
        params["token"] = token
        tokenTypeHint.map { params["token_type_hint"] = $0 }
        clientID.map { params["client_id"] = $0 }

        return params
    }

    public init(
        token: String,
        clientID: String? = .none,
        tokenTypeHint: String? = .none
    ) {
        self.token = token
        self.clientID = clientID
        self.tokenTypeHint = tokenTypeHint
    }

}
