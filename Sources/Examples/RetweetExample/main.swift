// RetweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

/// Demonstrates how to retweet a specific tweet using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to retweet a specific tweet using user ID and tweet ID
/// 3. Prints confirmation of the retweet action and its status
/// 4. Includes error handling for failed retweet attempts
@main
struct RetweetExample {
    static func main() async throws {
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )
        
        let userId = ProcessInfo.processInfo.environment["TWITTER_USER_ID"] ?? ""
        let tweetId = ProcessInfo.processInfo.environment["TWITTER_TWEET_ID"] ?? ""
        
        do {
            // Create and send the retweet request
            let request = PostUsersRetweetsRequestV2(userId: userId, tweetId: tweetId)
            let response = try await simpleClient.send(request)
            
            print("Successfully retweeted tweet with ID: \(tweetId)")
            print("Retweeted: \(response.data.retweeted)")
        } catch {
            print("Error retweeting: \(error)")
        }
    }
} 