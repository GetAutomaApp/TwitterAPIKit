import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve users who retweeted a specific tweet.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to get users who retweeted a tweet
/// 3. Prints the user information
@main
struct GetTweetsRetweetedByExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? "",
                clientSecret: ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? "",
                accessToken: ProcessInfo.processInfo.environment["TWITTER_ACCESS_TOKEN"] ?? "",
                refreshToken: nil
            )
        )

        let tweetId = "YOUR_TWEET_ID"
        let request = GetTweetsRetweetedByRequestV2(tweetId: tweetId)

        do {
            let response = try await client.send(request)
            print("\n🔁 Users who retweeted:")
            for user in response.data {
                print("@\(user.username) (\(user.name))")
            }
        } catch {
            print("Error retrieving retweeters: \(error)")
        }
    }
}
