import Foundation
import TwitterAPIKit

/// Demonstrates how to unretweet a tweet by the authenticated user.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to unretweet a tweet
/// 3. Prints the result
@main
struct DeleteUsersRetweetsExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? "",
                clientSecret: ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? "",
                accessToken: ProcessInfo.processInfo.environment["TWITTER_ACCESS_TOKEN"] ?? "",
                refreshToken: nil
            )
        )

        let userId = "YOUR_USER_ID"
        let tweetId = "YOUR_TWEET_ID"
        let request = DeleteUsersRetweetsRequestV2(userId: userId, tweetId: tweetId)

        do {
            let response = try await client.send(request)
            print("\n🗑️ Unretweet result: \(response.data)")
        } catch {
            print("Error unretweeting: \(error)")
        }
    }
}
