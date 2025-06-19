import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve the authenticated user's profile information using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to the /2/users/me endpoint to get the current user's profile
/// 3. Includes additional data like the user's pinned tweet
/// 4. Prints the user's name, username, and their pinned tweet (if one exists)
@main
struct GetAuthenticatedUserExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )
        
        let meRequest = GetUsersMeRequestV2(
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(meRequest)
            print("Authenticated User: \(response.data.name) (@\(response.data.username))")
            if let pinnedTweet = response.includes?.tweets?.first {
                print("Pinned Tweet: \(pinnedTweet.text)")
            }
        } catch {
            print("Error retrieving authenticated user: \(error)")
        }
    }
} 