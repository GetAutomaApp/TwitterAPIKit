// OAuth20RefreshExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import TwitterAPIKit

/// This example demonstrates how to refresh an OAuth 2.0 access token using a refresh token.
/// When an access token expires, you can use the refresh token to get a new access token
/// without requiring the user to re-authorize your application.
///
/// To run this example:
/// 1. Set your Twitter API credentials as environment variables:
///    export TWITTER_CLIENT_ID="your_client_id"
///    export TWITTER_CLIENT_SECRET="your_client_secret"
///    export TWITTER_REFRESH_TOKEN="your_refresh_token"
/// 2. Run the example: swift run OAuth20RefreshExample
///
/// The example will then print your new access token and refresh token.
@main
internal struct OAuth20RefreshExample {
    /// EntryPoint
    public static func main() async {
        do {
            // Get Twitter API credentials from environment variables
            let clientId = ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? ""
            let clientSecret = ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? ""
            let refreshToken = ProcessInfo.processInfo.environment["TWITTER_REFRESH_TOKEN"] ?? ""

            print("Starting OAuth 2.0 token refresh...")
            print("Using Client ID: \(clientId)")

            // Refresh the access token
            print("\nRefreshing access token...")
            let newTokens = try await refreshAccessToken(
                clientId: clientId,
                clientSecret: clientSecret,
                refreshToken: refreshToken
            )

            print("\nToken refresh completed successfully!")
            print("New Access Token: \(newTokens.accessToken)")
            print("Token Type: \(newTokens.tokenType)")
            print("Expires In: \(newTokens.expiresIn) seconds")
            print("Scope: \(newTokens.scope.joined(separator: " "))")
            if let newRefreshToken = newTokens.refreshToken {
                print("New Refresh Token: \(newRefreshToken)")
            }
        } catch let error as TwitterAPIError {
            print("\nTwitter API Error:")
            print("Error: \(error)")
        } catch {
            print("\nError: \(error)")
        }
    }

    /// Refreshes an expired access token using a refresh token.
    /// - Parameters:
    ///   - clientId: Your Twitter API client ID
    ///   - clientSecret: Your Twitter API client secret
    ///   - refreshToken: The refresh token obtained from the initial OAuth 2.0 flow
    /// - Returns: A new access token and refresh token
    private static func refreshAccessToken(
        clientId: String,
        clientSecret: String,
        refreshToken: String
    ) async throws -> TwitterOAuth2AccessToken {
        let session = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: clientId,
                clientSecret: clientSecret,
                accessToken: "",   // Not needed for refresh
                refreshToken: nil  // Not needed for refresh
            )
        )

        let oauthAPI = OAuth20API(session: session)
        let request = PostOAuth2RefreshTokenRequestV2(
            refreshToken: refreshToken,
            clientID: clientId
        )
        return try await oauthAPI.postOAuth2RefreshToken(request)
    }
}
