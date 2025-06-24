import Foundation
import TwitterAPIKit

/// Demonstrates how to retrieve a user's recent tweets using Twitter API v2.
/// This example:
/// 1. Creates a Twitter API client using environment variables for authentication
/// 2. Makes a request to fetch tweets from a specific user ID
/// 3. Handles pagination through the user's tweet history
/// 4. Prints each tweet's ID, text, creation time, and pagination metadata
/// 5. Includes comprehensive error handling for common API issues
@main
internal struct GetUserTweetsExample {
    /// EntryPoint
    public static func main() async throws {
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )

        // Create request to fetch tweets from your own account
        let userId = ProcessInfo.processInfo.environment["TWITTER_USER_ID"] ?? ""
        let request = GetUserTweetsRequestV2(userId: userId)

        do {
            // Make the request
            let response = try await simpleClient.send(request)

            // Print the tweets
            print("\n📱 User's Tweets:")
            for tweet in response.data {
                print("\nTweet ID: \(tweet.id)")
                print("Text: \(tweet.text)")
                print("Created at: \(tweet.createdAt)")
            }

            // Print pagination info
            print("\n📊 Meta Information:")
            print("Result count: \(response.meta.resultCount)")
            if let nextToken = response.meta.nextToken {
                print("Next token: \(nextToken)")
            }

        } catch let error as TwitterAPIError {
            handleError(error: error)
        } catch {
            print("❌ Error fetching tweets: \(error)")
        }
    }

    private static func handleError(error: TwitterAPIError) {
        switch error.errorType {
            case .unauthorized:
                print("Authentication failed")
            case .rateLimit:
                print("Rate limit exceeded")
            case .forbidden:
                print("Access forbidden")
            case .notFound:
                print("Resource not found")
            case .serverError:
                print("Twitter API server error")
            case .unknown:
                print("Unknown error: \(error.localizedDescription)")
            }
    }
}
