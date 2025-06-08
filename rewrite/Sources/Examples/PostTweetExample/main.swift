// PostTweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

@main
struct PostTweetExample {
    static func main() async throws {
        // Twitter API credentials (provided by user)
        let apiKey = "CONSUMER_KEY"
        let apiSecret = "CONSUMER_KEY_SECRET"
        let accessToken = "OAUTH_TOKEN"
        let accessTokenSecret = "OAUTH_SECRET_TOKEN"
        
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )

        // The text of the tweet you want to post
        let tweetText = "Hello, Twitter! This is a test tweet from TwitterAPIKit."
        
        do {
            // Create and send the tweet request
            let request = PostTweetsRequestV2(text: tweetText)
            // let response = try await simpleClient.send(request, authHeaderOverride: "OAuth oauth_consumer_key=\"KebJ7nY7FPcsiMuUkjhMXTUMf\",oauth_token=\"1859607209115619328-R9oNXSPOfI3oMYw1IQOcdIFROOJMKM\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"1749331943\",oauth_nonce=\"dsGhHcmAuPl\",oauth_version=\"1.0\",oauth_signature=\"C9PA3CZxFhJlZIdXqn3YI4Nf6No%3D\"")
            let response = try await simpleClient.send(request)
            
            print("Successfully posted tweet!")
            print("Tweet ID: \(response.data.id)")
            print("Tweet text: \(response.data.text)")
        } catch {
            print("Error posting tweet: \(error)")
        }
    }
} 