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
        let apiKey = "KebJ7nY7FPcsiMuUkjhMXTUMf"
        let apiSecret = "zJDH1jlx9WWMT2ekRuYaABX1Zb8JMBpKo2mdn4FaNCYAtBdnKo"
        let accessToken = "1859607209115619328-R9oNXSPOfI3oMYw1IQOcdIFROOJMKM"
        let accessTokenSecret = "cxI6j6nG3bNcm1qYUflMKSmSKC5nlVrgKWQJ3r7P4kL0B"
        
        // Create the environment with your credentials
        let simpleClient = SimpleTwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )

        // The ID of the user who is retweeting (must be the authenticated user)
        let userId = "1859607209115619328" // Replace with your user ID if different
        // The ID of the tweet you want to retweet
        let tweetId = "1931427021776908732" // Replace with the tweet ID you want to retweet
        
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