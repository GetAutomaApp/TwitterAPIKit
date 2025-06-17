// OAuth20API.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct OAuth20API {
    /// Twitter API Session
    public let session: TwitterAPISession

    // MARK: - OAuth 2.0 Bearer Token

    /// https://developer.twitter.com/en/docs/authentication/api-reference/token
    public func postOAuth2BearerTokenData(
        _ request: PostOAuth2TokenRequestV1
    ) async throws -> TwitterOAuth2BearerToken {
        return try await session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/token
    public func postOAuth2BearerToken(
        _ request: PostOAuth2TokenRequestV1
    ) async throws -> TwitterOAuth2BearerToken {
        return try await session.send(request)
    }

    /// https://developer.twitter.com/en/docs/authentication/api-reference/invalidate_bearer_token
    ///
    /// May not work.
    /// {"errors":[{"code":348,"message":"Client application is not permitted to to invalidate this token."}]}
    /// https://twittercommunity.com/t/oauth2-invalidate-token-not-working-for-app-only-authentication-tokens/133108
    /// https://twittercommunity.com/t/invalidate-bearer-client-application-not-permitted/162761
    public func postInvalidateOAuth2BearerToken(
        _ request: PostOAuth2InvalidateTokenRequestV1
    ) async throws -> TwitterAPIError {
        return try await session.send(request)
    }

    // MARK: - OAuth 2.0 Authorization Code Flow with PKCE

    /// Create OAuth 2.0  Authorize URL
    public func makeOAuth2AuthorizeURL(_ request: GetOAuth2AuthorizeRequestV1) -> URL? {
        try? request.buildRequest(environment: session.environment).url
    }

    public func postOAuth2AccessTokenData(
        _ request: PostOAuth2AccessTokenRequestV2
    ) async throws -> TwitterOAuth2AccessToken {
        return try await session.send(request)
    }

    public func postOAuth2AccessToken(
        _ request: PostOAuth2AccessTokenRequestV2
    ) async throws -> TwitterOAuth2AccessToken {
        return try await session.send(request)
    }

    public func postOAuth2RefreshTokenData(
        _ request: PostOAuth2RefreshTokenRequestV2
    ) async throws -> TwitterOAuth2AccessToken {
        return try await session.send(request)
    }

    public func postOAuth2RefreshToken(
        _ request: PostOAuth2RefreshTokenRequestV2
    ) async throws -> TwitterOAuth2AccessToken {
        return try await session.send(request)
    }

    public func postOAuth2RevokeToken(
        _ request: PostOAuth2RevokeTokenRequestV2
    ) async throws -> TwitterAPIError {
        return try await session.send(request)
    }
}
