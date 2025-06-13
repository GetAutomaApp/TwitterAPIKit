// GetTweetExample.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve a specific tweet and its associated data using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to fetch a specific tweet by ID
/// 3. Includes expanded data like author information, metrics, and referenced tweets
/// 4. Prints the tweet's content, metrics (retweets, likes, replies, quotes), and author details
@main
struct GetTweetExample {
    static func main() async throws {
        // Twitter API credentials
        let client = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
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
            
            let response = try await client.send(request)
            
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