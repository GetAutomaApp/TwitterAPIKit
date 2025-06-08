// RetweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

@main
struct RetweetExample {
    static func main() async throws {
        // Twitter API credentials (provided by user)
        let apiKey = "CONSUMER_KEY"
        let apiSecret = "CONSUMER_KEY_SECRET"
        let accessToken = "OAUTH_TOKEN"
        let accessTokenSecret = "OAUTH_SECRET_TOKEN"
        let userId = "USER_ID"
        let tweetId = "TWEET_ID"
        
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )
        
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