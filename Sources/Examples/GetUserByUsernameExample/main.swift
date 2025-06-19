import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve a specific user's profile by their Twitter username using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to fetch a user's profile using their @username
/// 3. Includes expanded data like their pinned tweet
/// 4. Prints the user's name, username, and pinned tweet (if one exists)
@main
struct GetUserByUsernameExample {
    static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )
        
        // Get user by username
        let elonMuskUsername = "elonmusk"
        let userByUsernameRequest = GetUsersByUsernameRequestV2(
            username: elonMuskUsername,
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(userByUsernameRequest)
            print("User: \(response.data.name) (@\(response.data.username))")
            if let pinnedTweet = response.includes?.tweets?.first {
                print("Pinned Tweet: \(pinnedTweet.text)")
            }
        } catch {
            print("Error retrieving user: \(error)")
        }
    }
} 