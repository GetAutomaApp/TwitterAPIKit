// TwitterOAuth2BearerToken.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents an OAuth 2.0 bearer token response from Twitter's API.
/// This token type is used for application-only authentication.
public struct TwitterOAuth2BearerToken: Decodable {
    /// The type of token, typically "bearer".
    public let tokenType: String

    /// The bearer token string used for API authentication.
    public let accessToken: String

    /// Creates a bearer token from JSON response data.
    /// - Parameter jsonData: The raw JSON data from Twitter's OAuth 2.0 token endpoint.
    /// Expected format: `{"token_type":"bearer","access_token":"ACCESS_TOKEN"}`
    /// - Throws: An error if JSON parsing fails.
    /// - Returns: An initialized bearer token if the JSON contains valid data, nil otherwise.
    public init?(jsonData: Data) throws {
        let json = try JSONSerialization.jsonObject(with: jsonData, options: [])

        guard let obj = json as? [String: Any],
              let tokenType = obj["token_type"] as? String,
              let accessToken = obj["access_token"] as? String
        else {
            return nil
        }

        self.tokenType = tokenType
        self.accessToken = accessToken
    }
}
