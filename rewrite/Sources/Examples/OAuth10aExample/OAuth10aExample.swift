// OAuth10aExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import TwitterAPIKit

@main
struct OAuth10aExample {
    static func main() async {
        do {
            // Your Twitter API credentials
            let consumerKey = ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? ""
            let consumerSecret = ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? ""
            let callbackURL = "twitter-api-kit-ios-sample://" // Using the same callback scheme as the old code
            
            guard !consumerKey.isEmpty, !consumerSecret.isEmpty else {
                print("Error: Please set TWITTER_CONSUMER_KEY and TWITTER_CONSUMER_SECRET environment variables")
                return
            }
            
            print("Starting OAuth 1.0a flow...")
            print("Using Consumer Key: \(consumerKey)")
            
            // Step 1: Get request token
            print("\nStep 1: Getting request token...")
            let requestToken = try await getRequestToken(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                callbackURL: callbackURL
            )
            print("Request Token: \(requestToken.oauthToken)")
            
            // Step 2: Get authorization URL
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
    
    private static func getRequestToken(
        consumerKey: String,
        consumerSecret: String,
        callbackURL: String
    ) async throws -> TwitterOAuthTokenV1 {
        // For request token, we only need consumer credentials - NO OAuth tokens
        let session = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: "",  // Empty string for request token
                oauthTokenSecret: ""  // Empty string for request token secret
            )
        )
        
        let oauthAPI = OAuth10aAPI(session: session)
        let request = PostOAuthRequestTokenRequestV1(oauthCallback: callbackURL)
        return try await oauthAPI.postOAuthRequestToken(request)
    }
    
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
                oauthToken: "",  // Empty string for request token
                oauthTokenSecret: ""  // Empty string for request token secret
            )
        )
        
        let oauthAPI = OAuth10aAPI(session: session)
        let request = GetOAuthAuthorizeRequestV1(oauthToken: requestToken)
        return oauthAPI.makeOAuthAuthorizeURL(request)
    }
    
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
                oauthTokenSecret: ""  // Empty string for request token secret
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