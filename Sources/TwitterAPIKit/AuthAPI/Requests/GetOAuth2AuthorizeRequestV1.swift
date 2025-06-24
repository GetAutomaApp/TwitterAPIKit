// GetOAuth2AuthorizeRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/authorization-code
/// https://developer.twitter.com/en/docs/authentication/oauth-2-0/user-access-token
public struct GetOAuth2AuthorizeRequestV1: TwitterAPIRequest {
    public typealias Response = TwitterAPIError
    
    public let responseType: String
    public let clientID: String
    public let redirectURI: String
    public let state: String
    public let codeChallenge: String
    public let codeChallengeMethod: String
    public let scopes: [TwitterOAuthScope]

    public var method: HTTPMethod {
        .get
    }

    public var baseURLType: TwitterBaseURLType {
        .twitter
    }

    public var path: String {
        "/i/oauth2/authorize"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()

        // Match the exact format of the working URL
        params["response_type"] = responseType
        params["client_id"] = clientID
        params["redirect_uri"] = redirectURI
        params["scope"] = scopes.map(\.rawValue).joined(separator: "+")
        params["state"] = state
        params["code_challenge"] = codeChallenge
        params["code_challenge_method"] = codeChallengeMethod
        return params
    }
    
    public var queryParameters: [String: Any] {
        parameters
    }
    
    public var bodyParameters: [String: Any] {
        [:]
    }
    
    public var bodyContentType: BodyContentType {
        .wwwFormUrlEncoded
    }

    public init(
        responseType: String = "code",
        clientID: String,
        redirectURI: String,
        state: String,
        codeChallenge: String,
        codeChallengeMethod: String = "plain",
        scopes: [TwitterOAuthScope]
    ) {
        self.responseType = responseType
        self.clientID = clientID
        self.redirectURI = redirectURI
        self.state = state
        self.codeChallenge = codeChallenge
        self.codeChallengeMethod = codeChallengeMethod
        self.scopes = scopes
    }
}
