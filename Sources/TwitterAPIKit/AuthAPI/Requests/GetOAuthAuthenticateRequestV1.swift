// GetOAuthAuthenticateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/authenticate
open class GetOAuthAuthenticateRequestV1: TwitterAPIRequest {
    public let oauthToken: String
    public let forceLogin: Bool?
    public let screenName: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/oauth/authenticate"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["oauth_token"] = oauthToken
        forceLogin.map { params["force_login"] = $0 }
        screenName.map { params["screen_name"] = $0 }
        return params
    }

    public init(
        oauthToken: String,
        forceLogin: Bool? = .none,
        screenName: String? = .none
    ) {
        self.oauthToken = oauthToken
        self.forceLogin = forceLogin
        self.screenName = screenName
    }

    deinit {
        // De-init Logic Here
    }
}
