// OAuth10aExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import TwitterAPIKit

// swiftlint:disable function_body_length

/// This example demonstrates the OAuth 1.0a authentication flow for Twitter API v1.
/// OAuth 1.0a is used for user authentication, allowing your application to act on behalf of a Twitter user.
///
/// The flow consists of three main steps:
/// 1. Get a request token - This is a temporary token used to start the OAuth process
/// 2. Get user authorization - The user authorizes your application to access their account
/// 3. Get an access token - Exchange the request token for a permanent access token
///
/// To run this example:
/// 1. Set your Twitter API credentials as environment variables:
///    export TWITTER_CONSUMER_KEY="your_consumer_key"
///    export TWITTER_CONSUMER_SECRET="your_consumer_secret"
/// 2. Run the example: swift run OAuth10aExample
/// 3. Open the authorization URL in your browser
/// 4. Authorize the application
/// 5. Enter the PIN code from the callback URL
///
/// The example will then print your access token and secret, which you can use to make authenticated API calls.
@main
internal struct OAuth10aExample {
    /// EntryPoint
    public static func main() async {
        do {
            // Get Twitter API credentials from environment variables
            let consumerKey = ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? ""
            let consumerSecret = ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? ""

            print("Starting OAuth 1.0a flow...")
            print("Using Consumer Key: \(consumerKey)")

            // Step 1: Get request token
            // This is a temporary token that will be used to start the OAuth process
            // We only need the consumer key and secret for this step
            print("\nStep 1: Getting request token...")
            let requestToken = try await getRequestToken(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret
            )
            print("Request Token: \(requestToken.oauthToken)")

            // Step 2: Get authorization URL
            // This URL will be opened in the user's browser
            // The user will authorize your application and get a PIN code
            print("\nStep 2: Getting authorization URL...")
            if let authURL = getAuthorizationURL(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                requestToken: requestToken.oauthToken
            ) {
                print("Authorization URL: \(authURL)")
                print("\nPlease open this URL in your browser and authorize the application.")
                print("After authorization, you'll be redirected to your callback URL with a verifier.")
                print("Enter the verifier from the callback URL:")

                // In a real application, you would handle the callback URL and get the verifier
                // For this example, we'll read it from console input
                guard let verifier = readLine() else {
                    print("No verifier provided")
                    return
                }

                // Step 3: Get access token
                // Exchange the request token and verifier for a permanent access token
                // This token can be used to make authenticated API calls
                print("\nStep 3: Getting access token...")
                let accessToken = try await getAccessToken(
                    consumerKey: consumerKey,
                    consumerSecret: consumerSecret,
                    requestToken: requestToken.oauthToken,
                    verifier: verifier
                )

                print("\nOAuth 1.0a flow completed successfully!")
                print("Access Token: \(accessToken.oauthToken)")
                print("Access Token Secret: \(accessToken.oauthTokenSecret)")
                if let userID = accessToken.userID {
                    print("User ID: \(userID)")
                }
                if let screenName = accessToken.screenName {
                    print("Screen Name: \(screenName)")
                }
            } else {
                print("Failed to get authorization URL")
            }
        } catch let error as TwitterAPIError {
            print("\nTwitter API Error:")
            print("Error: \(error)")
        } catch {
            print("\nError: \(error)")
        }
    }

    /// Gets a request token from Twitter's OAuth endpoint.
    /// This is the first step in the OAuth 1.0a flow.
    /// - Parameters:
    ///   - consumerKey: Your Twitter API consumer key
    ///   - consumerSecret: Your Twitter API consumer secret
    /// - Returns: A request token that can be used to start the OAuth process
    private static func getRequestToken(
        consumerKey: String,
        consumerSecret: String,
    ) async throws -> TwitterOAuthTokenV1 {
        // For request token, we only need consumer credentials - NO OAuth tokens
        let session = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: nil,  // No OAuth token for request token
                oauthTokenSecret: nil  // No OAuth token secret for request token
            )
        )

        let oauthAPI = OAuth10aAPI(session: session)
        let request = PostOAuthRequestTokenRequestV1(oauthCallback: "oob", xAuthAccessType: "write")
        return try await oauthAPI.postOAuthRequestToken(request)
    }

    /// Gets the authorization URL that the user needs to visit to authorize your application.
    /// This is the second step in the OAuth 1.0a flow.
    /// - Parameters:
    ///   - consumerKey: Your Twitter API consumer key
    ///   - consumerSecret: Your Twitter API consumer secret
    ///   - requestToken: The request token obtained from getRequestToken
    /// - Returns: The URL that the user needs to visit to authorize your application
    private static func getAuthorizationURL(
        consumerKey: String,
        consumerSecret: String,
        requestToken: String
    ) -> URL? {
        // For authorization URL, we only need consumer credentials
        let session = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: nil,  // No OAuth token needed
                oauthTokenSecret: nil  // No OAuth token secret needed
            )
        )

        let oauthAPI = OAuth10aAPI(session: session)
        let request = GetOAuthAuthorizeRequestV1(oauthToken: requestToken)
        return oauthAPI.makeOAuthAuthorizeURL(request)
    }

    /// Exchanges the request token and verifier for a permanent access token.
    /// This is the final step in the OAuth 1.0a flow.
    /// - Parameters:
    ///   - consumerKey: Your Twitter API consumer key
    ///   - consumerSecret: Your Twitter API consumer secret
    ///   - requestToken: The request token obtained from getRequestToken
    ///   - verifier: The verifier obtained from the user's authorization
    /// - Returns: A permanent access token that can be used to make authenticated API calls
    private static func getAccessToken(
        consumerKey: String,
        consumerSecret: String,
        requestToken: String,
        verifier: String
    ) async throws -> TwitterOAuthAccessTokenV1 {
        // For access token, we need both consumer credentials and request token
        let session = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: requestToken,
                oauthTokenSecret: nil  // No request token secret needed
            )
        )

        let oauthAPI = OAuth10aAPI(session: session)
        let request = PostOAuthAccessTokenRequestV1(
            oauthToken: requestToken,
            oauthVerifier: verifier
        )
        return try await oauthAPI.postOAuthAccessToken(request)
    }
}
// swiftlint:enable function_body_length
