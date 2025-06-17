// GetOAuthAuthenticateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/authenticate
public struct GetOAuthAuthenticateRequestV1: TwitterAPIRequest {
    public typealias Response = TwitterAPIError
    
    public let oauthToken: String
    public let forceLogin: Bool?
    public let screenName: String?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/oauth/authenticate"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["oauth_token"] = oauthToken
        forceLogin.map { params["force_login"] = $0 }
        screenName.map { params["screen_name"] = $0 }
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
        oauthToken: String,
        forceLogin: Bool? = nil,
        screenName: String? = nil
    ) {
        self.oauthToken = oauthToken
        self.forceLogin = forceLogin
        self.screenName = screenName
    }
}
