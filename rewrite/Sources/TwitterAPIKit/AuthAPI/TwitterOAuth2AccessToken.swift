// TwitterOAuth2AccessToken.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/* Example responses:
 Confidential client:
 {
    "scope" : "tweet.write tweet.read",
    "token_type" : "bearer",
    "expires_in" : 7200,
    "access_token" : "<token>"
 }

 Public client:
 {
    "refresh_token" : "<refresh token>",
    "scope" : "tweet.write tweet.read offline.access",
    "token_type" : "bearer",
    "expires_in" : 7200,
    "access_token" : "<token>"
 }
 */

/// Represents an OAuth 2.0 access token response from Twitter's API.
/// Contains the access token and associated metadata for both confidential and public clients.
public struct TwitterOAuth2AccessToken: Decodable {
    /// The scopes granted to this access token, as an array of permission strings.
    public let scope: [String]

    /// The type of token, typically "bearer".
    public let tokenType: String

    /// The number of seconds until the token expires.
    public let expiresIn: Int

    /// The access token string used for API authentication.
    public let accessToken: String

    /// The refresh token for obtaining new access tokens without re-authentication.
    /// Only available for public clients using PKCE flow.
    public let refreshToken: String?

    /// Creates an OAuth 2.0 access token from JSON response data.
    /// - Parameter jsonData: The raw JSON data from Twitter's OAuth 2.0 token endpoint.
    /// - Throws: An error if JSON parsing fails.
    /// - Returns: An initialized access token if the JSON contains valid data, nil otherwise.
    public init?(jsonData: Data) throws {
        let json = try JSONSerialization.jsonObject(with: jsonData, options: [])

        guard let obj = json as? [String: Any],
              let scope = obj["scope"] as? String,
              let tokenType = obj["token_type"] as? String,
              let expiresIn = obj["expires_in"] as? Int,
              let accessToken = obj["access_token"] as? String
        else { return nil }

        self.scope = scope.components(separatedBy: " ")
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.accessToken = accessToken
        refreshToken = obj["refresh_token"] as? String
    }
}