// TwitterAuthenticationMethod.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// Represents different methods of authentication available for Twitter API requests.
public enum TwitterAuthenticationMethod {    
    // swiftlint:disable sorted_enum_cases
    /// No authentication method specified.
    case basic(apiKey: String, apiSecretKey: String)

    /// Bearer token authentication for OAuth2 app-only access.
    case bearer(String)

    // swiftlint:disable discouraged_none_name 
    /// No authentication required.
    case `none`
    // swiftlint:enable discouraged_none_name
    
    /// Authentication using OAuth 1.0a protocol (legacy).
    @available(*, deprecated, renamed: "oauth10a")
    case oauth(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String?,
        oauthTokenSecret: String?
    )

    /// Authentication using OAuth 1.0a protocol.
    case oauth10a(OAuth10a)

    /// Authentication using OAuth 2.0 protocol.
    case oauth20(OAuth20)

    /// Used to execute the OAuth 2.0 Authorization Code Flow with PKCE authentication flow.
    case requestOAuth20WithPKCE(OAuth20WithPKCEClientType)
    // swiftlint:enable sorted_enum_cases
}

/// Extension containing OAuth-related types and functionality.
public extension TwitterAuthenticationMethod {
    /// Represents OAuth 1.0a authentication credentials.
    struct OAuth10a: Codable {
        /// The consumer key (API key) provided by Twitter.
        public var consumerKey: String
        
        /// The consumer secret (API secret key) provided by Twitter.
        public var consumerSecret: String
        
        /// The OAuth token obtained after user authorization.
        public var oauthToken: String?
        
        /// The OAuth token secret obtained after user authorization.
        public var oauthTokenSecret: String?

        /// Initializes a new OAuth10a authentication structure.
        /// - Parameters:
        ///   - consumerKey: The consumer key (API key) provided by Twitter
        ///   - consumerSecret: The consumer secret (API secret key) provided by Twitter
        ///   - oauthToken: The OAuth token obtained after user authorization
        ///   - oauthTokenSecret: The OAuth token secret obtained after user authorization
        public init(
            consumerKey: String,
            consumerSecret: String,
            oauthToken: String?,
            oauthTokenSecret: String?
        ) {
            self.consumerKey = consumerKey
            self.consumerSecret = consumerSecret
            self.oauthToken = oauthToken
            self.oauthTokenSecret = oauthTokenSecret
        }
    }

    /// Represents OAuth 2.0 authentication credentials and state.
    struct OAuth20: Codable {
        /// The client ID provided by Twitter.
        public var clientID: String
        
        /// The creation timestamp of the token.
        public var createdAt: Date
        
        /// The time in seconds until the token expires.
        public var expiresIn: Int
        
        /// The OAuth 2.0 access token.
        public var accessToken: String
        
        /// The refresh token for obtaining new access tokens (only for Public Client).
        public var refreshToken: String?
        
        /// The authorized scopes for this token.
        public var scope: [String]
        
        /// The type of token (usually "bearer").
        public var tokenType: String

        /// Estimates the expiration time of a token based on "expiresIn" and "createdAt".
        /// Since the server response does not include the creation time of the token, it contains a margin of error of
        /// a few seconds.
        public var expiresAt: Date {
            return createdAt.addingTimeInterval(TimeInterval(expiresIn))
        }

        /// Indicates whether the token has expired.
        public var expired: Bool {
            return expiresAt <= Date()
        }

        /// Initializes a new OAuth20 authentication structure.
        /// - Parameters:
        ///   - clientID: The client ID provided by Twitter
        ///   - scope: The authorized scopes for this token
        ///   - tokenType: The type of token (usually "bearer")
        ///   - expiresIn: The time in seconds until the token expires
        ///   - accessToken: The OAuth 2.0 access token
        ///   - refreshToken: The refresh token for obtaining new access tokens
        ///   - createdAt: The creation timestamp of the token
        public init(
            clientID: String,
            scope: [String],
            tokenType: String,
            expiresIn: Int,
            accessToken: String,
            refreshToken: String?,
            createdAt: Date = Date()
        ) {
            self.clientID = clientID
            self.scope = scope
            self.tokenType = tokenType
            self.expiresIn = expiresIn
            self.accessToken = accessToken
            self.refreshToken = refreshToken
            self.createdAt = createdAt
        }

        /// Initializes a new OAuth20 authentication structure from a Twitter OAuth2 access token.
        /// - Parameters:
        ///   - clientID: The client ID provided by Twitter
        ///   - token: The Twitter OAuth2 access token
        ///   - createdAt: The creation timestamp of the token
        public init(clientID: String, token: TwitterOAuth2AccessToken, createdAt: Date = Date()) {
            self.init(
                clientID: clientID,
                scope: token.scope,
                tokenType: token.tokenType,
                expiresIn: token.expiresIn,
                accessToken: token.accessToken,
                refreshToken: token.refreshToken,
                createdAt: createdAt
            )
        }

        /// Refreshes the OAuth20 token with new values.
        /// - Parameters:
        ///   - token: The new Twitter OAuth2 access token
        ///   - refreshedAt: The timestamp when the token was refreshed
        public mutating func refresh(token: TwitterOAuth2AccessToken, refreshedAt: Date = Date()) {
            scope = token.scope
            tokenType = token.tokenType
            expiresIn = token.expiresIn
            accessToken = token.accessToken
            refreshToken = token.refreshToken
            createdAt = refreshedAt
        }
    }

    /// Represents the client type for OAuth 2.0 with PKCE flow.
    enum OAuth20WithPKCEClientType {
        /// A confidential client with client ID and secret.
        case confidentialClient(clientID: String, clientSecret: String)
        /// A public client without a client secret.
        case publicClient
    }
}
