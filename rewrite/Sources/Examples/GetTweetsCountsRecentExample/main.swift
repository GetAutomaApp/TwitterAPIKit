import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve tweet counts from the last 7 days.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to count tweets matching a search query
/// 3. Specifies a time range and granularity for the counts
/// 4. Prints the tweet counts for each time period
@main
struct GetTweetsCountsRecentExample {
    static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
        )
        
        // Create a date formatter for parsing dates
        let dateFormatter = ISO8601DateFormatter()
        
        // Set up the time range (last 24 hours)
        let endTime = Date()
        let startTime = Calendar.current.date(byAdding: .hour, value: -24, to: endTime)!
        
        // Create the request
        let request = GetTweetsCountsRecentRequestV2(
            query: "Swift",
            endTime: endTime,
            granularity: .hour,
            startTime: startTime
        )
        
        do {
            let response = try await client.send(request)
            
            print("\n📊 Tweet Counts for 'Swift':")
            for count in response.data {
                print("\nPeriod: \(dateFormatter.string(from: count.start)) to \(dateFormatter.string(from: count.end))")
                print("Tweet Count: \(count.tweetCount)")
            }
            
            print("\n📈 Total Tweets: \(response.meta.totalTweetCount)")
        } catch {
            print("Error retrieving tweet counts: \(error)")
        }
    }
} 