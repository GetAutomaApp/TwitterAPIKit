import Foundation
import TwitterAPIKit

@main
struct GetUserTweetsExample {
    static func main() async throws {
        let apiKey = "CONSUMER_KEY"
        let apiSecret = "CONSUMER_KEY_SECRET"
        let accessToken = "OAUTH_TOKEN"
        let accessTokenSecret = "OAUTH_SECRET_TOKEN"

        // Create the environment with your credentials
        let simpleClient = TwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )

        // Create request to fetch tweets from your own account
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
