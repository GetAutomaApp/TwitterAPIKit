import Foundation
import TwitterAPIKit

/// Demonstrates how to search recent tweets using the recent search endpoint.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to search recent tweets matching a query
/// 3. Prints the results
@main
struct GetTweetsSearchRecentExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? "",
                clientSecret: ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? "",
                accessToken: ProcessInfo.processInfo.environment["TWITTER_ACCESS_TOKEN"] ?? "",
                refreshToken: nil
            )
        )

        let request = GetTweetsSearchRecentRequestV2(
            query: "Swift",
            maxResults: 10
        )

        do {
            let response = try await client.send(request)
            print("\n🔎 Recent Search Results:")
            for tweet in response.data {
                print("\(tweet.id): \(tweet.text)")
            }
            print("\nMeta: \(response.meta)")
        } catch {
            print("Error searching recent tweets: \(error)")
        }
    }
}
