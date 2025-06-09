// RetweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

@main
struct RetweetExample {
    static func main() async throws {
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
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