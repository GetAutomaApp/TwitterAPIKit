import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve a specific user's profile by their Twitter ID using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to fetch a user's profile using their numeric ID
/// 3. Includes expanded data like their pinned tweet
/// 4. Prints the user's name, username, profile image URL, and pinned tweet (if one exists)
@main
struct GetUserByIdExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )
        
        let elonMuskID = "44196397"
        let userRequest = GetUserRequestV2(
            id: elonMuskID,
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(userRequest)
            print("User: \(response.data.name) (@\(response.data.username)) \(response.data.profileImageUrl ?? "")")
            if let pinnedTweet = response.includes?.tweets?.first {
                print("Pinned Tweet: \(pinnedTweet.text)")
            }
        } catch {
            print("Error retrieving user: \(error)")
        }
    }
} 