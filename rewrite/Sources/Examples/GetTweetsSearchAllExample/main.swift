import Foundation
import TwitterAPIKit

/// Demonstrates how to search all tweets using the full-archive search endpoint.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to search tweets matching a query
/// 3. Prints the results
/// Note: This endpoint requires Academic Research access.
@main
struct GetTweetsSearchAllExample {
    static func main() async throws {
        let client = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? "",
                clientSecret: ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? "",
                accessToken: ProcessInfo.processInfo.environment["TWITTER_ACCESS_TOKEN"] ?? "",
                refreshToken: nil
            )
        )

        let endTime = Date()
        let startTime = Calendar.current.date(byAdding: .day, value: -30, to: endTime)!

        let request = GetTweetsSearchAllRequestV2(
            query: "TwitterAPIKit",
            endTime: endTime,
            maxResults: 10,
            startTime: startTime
        )

        do {
            let response = try await client.send(request)
            print("\n🔎 Search Results:")
            for tweet in response.data {
                print("\(tweet.id): \(tweet.text)")
            }
            print("\nMeta: \(response.meta)")
        } catch {
            print("Error searching tweets: \(error)")
        }
    }
}
