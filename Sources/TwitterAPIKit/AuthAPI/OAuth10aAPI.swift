// OAuth10aAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class OAuth10aAPI: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/authentication/api-reference/request_token
    public func postOAuthRequestTokenData(
        _ request: PostOAuthRequestTokenRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/request_token
    public func postOAuthRequestToken(
        _ request: PostOAuthRequestTokenRequestV1
    ) -> TwitterAPISessionSpecializedTask<TwitterOAuthTokenV1> {
        session.send(request)
            .specialized { data in
                guard let token = TwitterOAuthTokenV1(queryStringData: data) else {
                    throw TwitterAPIKitError.responseSerializeFailed(
                        reason: .cannotConvert(data: data, toTypeName: "TwitterOAuthTokenV1")
                    )
                }
                return token
            }
    }

    /// Create https://developer.twitter.com/en/docs/authentication/api-reference/authorize URL.
    public func makeOAuthAuthorizeURL(_ request: GetOAuthAuthorizeRequestV1) -> URL? {
        // ignore exception
        try? request.buildRequest(environment: session.environment).url
    }

    /// Create https://developer.twitter.com/en/docs/authentication/api-reference/authenticate URL.
    public func makeOAuthAuthenticateURL(_ request: GetOAuthAuthenticateRequestV1) -> URL? {
        // ignore exception
        try? request.buildRequest(environment: session.environment).url
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/access_token
    public func postOAuthAccessTokenData(
        _ request: PostOAuthAccessTokenRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/access_token
    public func postOAuthAccessToken(
        _ request: PostOAuthAccessTokenRequestV1
    ) -> TwitterAPISessionSpecializedTask<TwitterOAuthAccessTokenV1> {
        session.send(request)
            .specialized { data in
                guard let token = TwitterOAuthAccessTokenV1(queryStringData: data) else {
                    throw TwitterAPIKitError.responseSerializeFailed(
                        reason: .cannotConvert(data: data, toTypeName: "TwitterOAuthAccessTokenV1")
                    )
                }
                return token
            }
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/invalidate_access_token
    public func postInvalidateAccessToken(
        _ request: PostOAuthInvalidateTokenRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
