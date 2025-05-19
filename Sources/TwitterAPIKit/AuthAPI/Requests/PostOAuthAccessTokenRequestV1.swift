// PostOAuthAccessTokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/access_token
open class PostOAuthAccessTokenRequestV1: TwitterAPIRequest {
    public let oauthToken: String
    public let oauthVerifier: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/oauth/access_token"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["oauth_token"] = oauthToken
        params["oauth_verifier"] = oauthVerifier
        return params
    }

    public init(
        oauthToken: String,
        oauthVerifier: String
    ) {
        self.oauthToken = oauthToken
        self.oauthVerifier = oauthVerifier
    }

    deinit {
        // De-init logic here
    }
}
