// GetTweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

@main
struct GetTweetExample {
    static func main() async throws {
        // Twitter API credentials
        let apiKey = "CONSUMER_KEY"
        let apiSecret = "CONSUMER_KEY_SECRET"
        let accessToken = "OAUTH_TOKEN"
        let accessTokenSecret = "OAUTH_SECRET_TOKEN"
        
        let simpleClient = TwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )

        let tweetId = "1931427021776908732"
        
        do {
            let request = GetTweetRequestV2(
                id: tweetId,
                expansions: [
                    .authorID,
                    .referencedTweetsID
                ],
                tweetFields: [
                    .createdAt,
                    .text,
                    .publicMetrics,
                    .entities
                ],
                userFields: [
                    .name,
                    .username,
                    .profileImageUrl
                ]
            )
            
            let response = try await simpleClient.send(request)
            
            print("Successfully retrieved tweet!")
            print("Tweet ID: \(response.data.id)")
            print("Tweet text: \(response.data.text)")
            print("Created at: \(String(describing: response.data.createdAt))")
            
            if let metrics = response.data.publicMetrics {
                print("Metrics:")
                print("- Retweets: \(metrics.retweetCount)")
                print("- Likes: \(metrics.likeCount)")
                print("- Replies: \(metrics.replyCount)")
                print("- Quotes: \(metrics.quoteCount)")
            }
            
            if let author = response.includes?.users?.first {
                print("\nAuthor:")
                print("- Name: \(author.name)")
                print("- Username: @\(author.username)")
            }
        } catch {
            print("Error retrieving tweet: \(error)")
        }
    }
} 