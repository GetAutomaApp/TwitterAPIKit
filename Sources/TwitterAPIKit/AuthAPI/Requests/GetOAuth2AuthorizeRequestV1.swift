// GetOAuth2AuthorizeRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/authorization-code
/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/user-access-token
open class GetOAuth2AuthorizeRequestV1: TwitterAPIRequest {
    public let responseType: String
    public let clientID: String
    public let redirectURI: String
    public let state: String
    public let codeChallenge: String
    public let codeChallengeMethod: String
    public let scopes: [String]

    public var method: HTTPMethod {
        return .get
    }

    public var baseURLType: TwitterBaseURLType {
        return .twitter
    }

    public var path: String {
        return "/i/oauth2/authorize"
    }

    public var parameters: [String: Any] {
        var params = [String: String]()

        params["response_type"] = responseType
        params["client_id"] = clientID
        params["redirect_uri"] = redirectURI
        params["state"] = state
        params["code_challenge"] = codeChallenge
        params["code_challenge_method"] = codeChallengeMethod
        params["scope"] = scopes.joined(separator: " ")
        return params
    }

    public init(
        responseType: String = "code",
        clientID: String,
        redirectURI: String,
        state: String,
        codeChallenge: String,
        codeChallengeMethod: String,
        scopes: [String]
    ) {
        self.responseType = responseType
        self.clientID = clientID
        self.redirectURI = redirectURI
        self.state = state
        self.codeChallenge = codeChallenge
        self.codeChallengeMethod = codeChallengeMethod
        self.scopes = scopes
    }

    deinit {
        // De-init Logic Here
    }
}
