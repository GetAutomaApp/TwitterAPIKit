// TwitterOAuthTokenV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// Represents an OAuth 1.0a request token response from Twitter's API.
/// This token is used in the first step of the OAuth 1.0a authentication flow.
public struct TwitterOAuthTokenV1 {
    /// The OAuth token string used for authentication.
    public let oauthToken: String
    
    /// The OAuth token secret used for signing requests.
    public let oauthTokenSecret: String
    
    /// Indicates whether the OAuth callback was confirmed by Twitter.
    /// This is typically true for OAuth 1.0a requests with a callback URL.
    public let oauthCallbackConfirmed: Bool?

    /// Creates an OAuth token from a query string response.
    /// - Parameter queryStringData: The raw data containing the OAuth response in query string format.
    /// Expected format: `oauth_token=TOKEN&oauth_token_secret=SECRET&oauth_callback_confirmed=true`
    /// - Returns: An initialized token if the query string contains valid OAuth token and secret, nil otherwise.
    public init?(queryStringData: Data) {
        let query = String(data: queryStringData, encoding: .utf8)

        var comp = URLComponents()
        comp.query = query

        guard let oauthToken = comp.queryItems?.first(where: { $0.name == "oauth_token" })?.value,
              let oauthTokenSecret = comp.queryItems?.first(where: { $0.name == "oauth_token_secret" })?.value
        else {
            return nil
        }

        let oauthCallbackConfirmed = comp.queryItems?
            .first { $0.name == "oauth_callback_confirmed" }
            .map { $0.value == "true" }

        self.oauthToken = oauthToken
        self.oauthTokenSecret = oauthTokenSecret
        self.oauthCallbackConfirmed = oauthCallbackConfirmed
    }

    /// Creates an OAuth token with the specified values.
    /// - Parameters:
    ///   - oauthToken: The OAuth token string.
    ///   - oauthTokenSecret: The OAuth token secret.
    ///   - oauthCallbackConfirmed: Whether the OAuth callback was confirmed (optional).
    public init(
        oauthToken: String,
        oauthTokenSecret: String,
        oauthCallbackConfirmed: Bool? = .none
    ) {
        self.oauthToken = oauthToken
        self.oauthTokenSecret = oauthTokenSecret
        self.oauthCallbackConfirmed = oauthCallbackConfirmed
    }
}
