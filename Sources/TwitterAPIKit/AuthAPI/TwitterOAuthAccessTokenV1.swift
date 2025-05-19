// TwitterOAuthAccessTokenV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// Represents an OAuth 1.0a access token for Twitter API v1 authentication.
public struct TwitterOAuthAccessTokenV1 {
    /// The OAuth token string used for authentication.
    public let oauthToken: String
    
    /// The OAuth token secret used for signing requests.
    public let oauthTokenSecret: String

    // According to RFC5849, there is no mention of the user_id and screen_name parameters,
    // but TwitterAPI does include them in its response.

    /// The unique identifier of the authenticated user.
    public let userID: String?
    
    /// The screen name (username) of the authenticated user.
    public let screenName: String?

    /// Creates an OAuth access token from a query string response.
    /// - Parameter queryStringData: The raw data containing the OAuth response in query string format.
    /// The expected format is:
    /// ```
    /// oauth_token=your_oauth_token&oauth_token_secret=your_oauth_token_secret \
    /// &user_id=numeric_user_id&screen_name=your_screen_name
    /// ```
    /// - Returns: An initialized access token if the query string contains valid OAuth token and secret, nil otherwise.
    public init?(queryStringData: Data) {
        let query = String(data: queryStringData, encoding: .utf8)

        var comp = URLComponents()
        comp.query = query
        guard let oauthToken = comp.queryItems?.first(where: { $0.name == "oauth_token" })?.value,
              let oauthTokenSecret = comp.queryItems?.first(where: { $0.name == "oauth_token_secret" })?.value
        else {
            return nil
        }

        self.oauthToken = oauthToken
        self.oauthTokenSecret = oauthTokenSecret
        userID = comp.queryItems?.first { $0.name == "user_id" }?.value
        screenName = comp.queryItems?.first { $0.name == "screen_name" }?.value
    }

    /// Creates an OAuth access token with the specified values.
    /// - Parameters:
    ///   - oauthToken: The OAuth token string.
    ///   - oauthTokenSecret: The OAuth token secret.
    ///   - userID: The unique identifier of the authenticated user (optional).
    ///   - screenName: The screen name of the authenticated user (optional).
    public init(
        oauthToken: String,
        oauthTokenSecret: String,
        userID: String? = .none,
        screenName: String? = .none
    ) {
        self.oauthToken = oauthToken
        self.oauthTokenSecret = oauthTokenSecret
        self.userID = userID
        self.screenName = screenName
    }
}
