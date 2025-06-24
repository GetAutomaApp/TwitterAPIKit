import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve tweet counts from the last 7 days.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to count tweets matching a search query
/// 3. Specifies a time range and granularity for the counts
/// 4. Prints the tweet counts for each time period
@main
internal struct GetTweetsCountsRecentExample {
    /// EntryPoint
    public static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            authenticationType: .oauth20(
                clientId: ProcessInfo.processInfo.environment["TWITTER_CLIENT_ID"] ?? "",
                clientSecret: ProcessInfo.processInfo.environment["TWITTER_CLIENT_SECRET"] ?? "",
                accessToken: ProcessInfo.processInfo.environment["TWITTER_ACCESS_TOKEN"] ?? "",
                refreshToken: nil
            )
        )

        // Set up the time range (last 24 hours)
        let endTime = Date()
        guard let startTime = Calendar.current.date(byAdding: .hour, value: -24, to: endTime) else {
            throw URLError(.badURL)
        }

        // Create the request
        let request = GetTweetsCountsRecentRequestV2(
            query: "Swift",
            endTime: endTime,
            granularity: .hour,
            startTime: startTime
        )

        do {
            let response = try await client.send(request)

            print("\n📈 Total Tweets: \(response.meta.totalTweetCount)")
        } catch {
            print("Error retrieving tweet counts: \(error)")
        }
    }
}
