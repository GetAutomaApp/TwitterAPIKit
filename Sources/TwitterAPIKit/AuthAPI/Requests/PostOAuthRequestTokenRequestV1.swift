// PostOAuthRequestTokenRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/request_token
open class PostOAuthRequestTokenRequestV1: TwitterAPIRequest {
    /// If you are using pin-based authorization, you will need to set this to oob
    public let oauthCallback: String

    /// read or write
    public let xAuthAccessType: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/oauth/request_token"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["oauth_callback"] = oauthCallback
        xAuthAccessType.map { params["x_auth_access_type"] = $0 }
        return params
    }

    public init(
        oauthCallback: String,
        xAuthAccessType: String? = .none
    ) {
        self.oauthCallback = oauthCallback
        self.xAuthAccessType = xAuthAccessType
    }

    deinit {
        // De-init Logic Here
    }
}
