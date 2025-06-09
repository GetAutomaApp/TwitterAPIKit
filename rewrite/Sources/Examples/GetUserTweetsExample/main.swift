import Foundation
import TwitterAPIKit

@main
struct GetUserTweetsExample {
    static func main() async throws {
        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
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
                print("Created at: \(tweet.created_at)")
            }

            // Print pagination info
            print("\n📊 Meta Information:")
            print("Result count: \(response.meta.result_count)")
            if let nextToken = response.meta.next_token {
                print("Next token: \(nextToken)")
            }

        } catch let error as TwitterAPIError {
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
        } catch {
            print("❌ Error fetching tweets: \(error)")
        }
    }
}
