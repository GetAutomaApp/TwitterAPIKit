// OAuth10aAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct OAuth10aAPI {
    /// Twitter API Session
    public let session: TwitterAPISession

    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/request_token
    public func postOAuthRequestTokenData(
        _ request: PostOAuthRequestTokenRequestV1
    ) async throws ->  TwitterOAuthTokenV1 {
        let response = try await session.send(request)
        return response
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/request_token
    public func postOAuthRequestToken(
        _ request: PostOAuthRequestTokenRequestV1
    ) async throws -> TwitterOAuthTokenV1 {
        return try await session.send(request) 
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
    ) async throws -> TwitterOAuthAccessTokenV1 {
        return try await session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/access_token
    public func postOAuthAccessToken(
        _ request: PostOAuthAccessTokenRequestV1
    ) async throws -> TwitterOAuthAccessTokenV1 {
        return try await session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/invalidate_access_token
    public func postInvalidateAccessToken(
        _ request: PostOAuthInvalidateTokenRequestV1
    ) async throws -> TwitterAPIError {
        return try await session.send(request)
    }
}
