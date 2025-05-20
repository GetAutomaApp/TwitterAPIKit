// PostOAuth2RefreshTokenRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/user-access-token
open class PostOAuth2RefreshTokenRequestV2: TwitterAPIRequest {
    public let refreshToken: String
    public let grantType: String
    /// Required for Public Client.
    public let clientID: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/oauth2/token"
    }

    public var parameters: [String: Any] {
        var params = [String: String]()

        params["refresh_token"] = refreshToken
        params["grant_type"] = grantType
        clientID.map { params["client_id"] = $0 }

        return params
    }

    public init(
        refreshToken: String,
        grantType: String = "refresh_token",
        clientID: String? = .none
    ) {
        self.refreshToken = refreshToken
        self.grantType = grantType
        self.clientID = clientID
    }

    deinit {
        // De-init Logic Here
    }
}
