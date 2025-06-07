// PostOAuth2AccessTokenRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct PostOAuth2AccessTokenRequestV2: TwitterAPIRequest {
    public let code: String
    public let grantType: String
    /// Required for Public Client.
    public let clientID: String?
    public let redirectURI: String
    public let codeVerifier: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/oauth2/token"
    }

    public var parameters: [String: Any] {
        var params = [String: String]()
        params["code"] = code
        params["grant_type"] = grantType
        clientID.map { params["client_id"] = $0 }
        params["redirect_uri"] = redirectURI
        params["code_verifier"] = codeVerifier
        return params
    }

    public init(
        code: String,
        grantType: String = "authorization_code",
        clientID: String? = .none,
        redirectURI: String,
        codeVerifier: String
    ) {
        self.code = code
        self.grantType = grantType
        self.clientID = clientID
        self.redirectURI = redirectURI
        self.codeVerifier = codeVerifier
    }

}
