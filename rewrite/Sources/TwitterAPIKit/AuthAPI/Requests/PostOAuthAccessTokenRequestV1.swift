// PostOAuthAccessTokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/access_token
public struct PostOAuthAccessTokenRequestV1: TwitterAPIRequest {
    public typealias Response = TwitterOAuthAccessTokenV1
    
    public let oauthToken: String
    public let oauthVerifier: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/oauth/access_token"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["oauth_token"] = oauthToken
        params["oauth_verifier"] = oauthVerifier
        return params
    }
    
    public var queryParameters: [String: Any] {
        [:]
    }
    
    public var bodyParameters: [String: Any] {
        parameters
    }
    
    public var bodyContentType: BodyContentType {
        .wwwFormUrlEncoded
    }

    public init(
        oauthToken: String,
        oauthVerifier: String
    ) {
        self.oauthToken = oauthToken
        self.oauthVerifier = oauthVerifier
    }
}
