import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve multiple users' profiles by their Twitter usernames using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to fetch multiple users' profiles using their @usernames
/// 3. Includes expanded data like their pinned tweets
/// 4. Prints each user's name and username
@main
struct GetUsersByUsernamesExample {
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
        
        // Get multiple users by usernames
        let elonMuskUsername = "elonmusk"
        let twitterUsername = "twitter"
        let usersByUsernamesRequest = GetUsersByRequestV2(
            usernames: [elonMuskUsername, twitterUsername],
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(usersByUsernamesRequest)
            for user in response.data {
                print("User: \(user.name) (@\(user.username))")
            }
        } catch {
            print("Error retrieving users: \(error)")
        }
    }
} 