// PostTweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

@main
struct PostTweetExample {
    static func main() async throws {
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
        )

        // The text of the tweet you want to post
        let tweetText = "Hello, Twitter! This is a test tweet from TwitterAPIKit."
        
        do {
            // Create and send the tweet request
            let request = PostTweetsRequestV2(text: tweetText)
            let response = try await simpleClient.send(request)
            
            print("Successfully posted tweet!")
            print("Tweet ID: \(response.data.id)")
            print("Tweet text: \(response.data.text)")
        } catch {
            print("Error posting tweet: \(error)")
        }
    }
} 