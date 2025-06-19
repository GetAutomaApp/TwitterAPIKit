// OAuth20Example.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import TwitterAPIKit
import Crypto

/// This example demonstrates the OAuth 2.0 authentication flow for Twitter API v2.
/// OAuth 2.0 is used for user authentication, allowing your application to act on behalf of a Twitter user.
///
/// The flow consists of three main steps:
/// 1. Generate a code challenge and verifier for PKCE
/// 2. Get user authorization - The user authorizes your application to access their account
/// 3. Get an access token - Exchange the authorization code for an access token
///
/// To run this example:
/// 1. Set your Twitter API credentials as environment variables:
///    export TWITTER_CLIENT_ID="your_client_id"
///    export TWITTER_CLIENT_SECRET="your_client_secret"
///    export TWITTER_REDIRECT_URI="your_redirect_uri"
/// 2. Run the example: swift run OAuth20Example
/// 3. Open the authorization URL in your browser
/// 4. Authorize the application
/// 5. Enter the authorization code from the callback URL
///
/// The example will then print your access token and refresh token, which you can use to make authenticated API calls.
@main
struct OAuth20Example {
    static func main() async {
        do {
            // Get Twitter API credentials from environment variables
            let clientId = ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? ""
            let clientSecret = ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? ""
            let redirectURI = ProcessInfo.processInfo.environment["TWITTER_REDIRECT_URI"] ?? ""
            
            guard !clientId.isEmpty, !clientSecret.isEmpty, !redirectURI.isEmpty else {
                print("Error: Please set TWITTER_CLIENT_ID, TWITTER_CLIENT_SECRET, and TWITTER_REDIRECT_URI environment variables")
                return
            }
            
            print("Starting OAuth 2.0 flow...")
            print("Using Client ID: \(clientId)")
            
            // Step 1: Generate PKCE challenge and verifier
            print("\nStep 1: Generating PKCE challenge and verifier...")
            let codeVerifier = generateCodeVerifier()
            let codeChallenge = codeVerifier  // For plain method, challenge is same as verifier
            print("Code Verifier: \(codeVerifier)")
            print("Code Challenge: \(codeChallenge)")
            
            // Generate a random state for security
            let state = generateRandomState()
            print("State: \(state)")
            
            // Step 2: Get authorization URL
            print("\nStep 2: Getting authorization URL...")
            if let authURL = getAuthorizationURL(
                clientId: clientId,
                redirectURI: redirectURI,
                codeChallenge: codeChallenge,
                state: state
            ) {
                print("Authorization URL: \(authURL)")
                print("\nPlease open this URL in your browser and authorize the application.")
                print("After authorization, you'll be redirected to your callback URL with an authorization code.")
                print("Enter the authorization code from the callback URL:")
                
                // In a real application, you would handle the callback URL and get the code
                // For this example, we'll read it from console input
                guard let code = readLine() else {
                    print("No authorization code provided")
                    return
                }
                
                // Step 3: Get access token
                print("\nStep 3: Getting access token...")
                let accessToken = try await getAccessToken(
                    clientId: clientId,
                    clientSecret: clientSecret,
                    redirectURI: redirectURI,
                    code: code,
                    codeVerifier: codeVerifier
                )
                
                print("\nOAuth 2.0 flow completed successfully!")
                print("Access Token: \(accessToken.accessToken)")
                print("Token Type: \(accessToken.tokenType)")
                print("Expires In: \(accessToken.expiresIn) seconds")
                print("Scope: \(accessToken.scope.joined(separator: " "))")
                if let refreshToken = accessToken.refreshToken {
                    print("Refresh Token: \(refreshToken)")
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
    
    /// Generates a random code verifier for PKCE.
    /// - Returns: A random string suitable for use as a code verifier
    private static func generateCodeVerifier() -> String {
        // Generate a very short verifier (8 characters)
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let length = 8
        let verifier = String((0..<length).map { _ in allowedChars.randomElement()! })
        
        // Base64 encode the verifier
        let data = verifier.data(using: .utf8)!
        return data.base64EncodedString()
    }
    
    /// Generates a random state parameter for security.
    /// - Returns: A random string suitable for use as a state parameter
    private static func generateRandomState() -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let length = 32
        return String((0..<length).map { _ in allowedChars.randomElement()! })
    }
    
    /// Gets the authorization URL that the user needs to visit to authorize your application.
    /// This is the second step in the OAuth 2.0 flow.
    /// - Parameters:
    ///   - clientId: Your Twitter API client ID
    ///   - redirectURI: The URI that Twitter will redirect to after authorization
    ///   - codeChallenge: The PKCE code challenge
    ///   - state: A random state parameter for security
    /// - Returns: The URL that the user needs to visit to authorize your application
    private static func getAuthorizationURL(
        clientId: String,
        redirectURI: String,
        codeChallenge: String,
        state: String
    ) -> URL? {
        let session = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: clientId,
                clientSecret: "",  // Not needed for authorization URL
                accessToken: "",   // Not needed for authorization URL
                refreshToken: nil  // Not needed for authorization URL
            )
        )
        
        let oauthAPI = OAuth20API(session: session)
        let request = GetOAuth2AuthorizeRequestV1(
            clientID: clientId,
            redirectURI: redirectURI,
            state: state,
            codeChallenge: codeChallenge,
            codeChallengeMethod: "plain",
            scopes: [.tweetRead]
        )
        return oauthAPI.makeOAuth2AuthorizeURL(request)
    }
    
    /// Exchanges the authorization code for an access token.
    /// This is the final step in the OAuth 2.0 flow.
    /// - Parameters:
    ///   - clientId: Your Twitter API client ID
    ///   - clientSecret: Your Twitter API client secret
    ///   - redirectURI: The URI that Twitter will redirect to after authorization
    ///   - code: The authorization code obtained from the user's authorization
    ///   - codeVerifier: The PKCE code verifier
    /// - Returns: An access token that can be used to make authenticated API calls
    private static func getAccessToken(
        clientId: String,
        clientSecret: String,
        redirectURI: String,
        code: String,
        codeVerifier: String
    ) async throws -> TwitterOAuth2AccessToken {
        let session = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: clientId,
                clientSecret: clientSecret,
                accessToken: "",   // Not needed for token request
                refreshToken: nil  // Not needed for token request
            )
        )
        
        let oauthAPI = OAuth20API(session: session)
        let request = PostOAuth2AccessTokenRequestV2(
            code: code,
            clientID: clientId,  // Include client ID for public client
            redirectURI: redirectURI,
            codeVerifier: codeVerifier
        )
        return try await oauthAPI.postOAuth2AccessToken(request)
    }
} 