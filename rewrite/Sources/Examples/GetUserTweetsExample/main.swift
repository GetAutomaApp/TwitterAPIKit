import Foundation
import TwitterAPIKit

@main
struct GetUserTweetsExample {
    static func main() async throws {
        // Your Twitter API credentials
        // let apiKey = "CONSUMER_KEY"
        // let apiSecret = "CONSUMER_KEY_SECRET"
        // let accessToken = "OAUTH_TOKEN"
        // let accessTokenSecret = "OAUTH_SECRET_TOKEN"
        // let userId = "USER_ID"

        let apiKey = "KebJ7nY7FPcsiMuUkjhMXTUMf"
        let apiSecret = "zJDH1jlx9WWMT2ekRuYaABX1Zb8JMBpKo2mdn4FaNCYAtBdnKo"
        let accessToken = "1859607209115619328-R9oNXSPOfI3oMYw1IQOcdIFROOJMKM"
        let accessTokenSecret = "cxI6j6nG3bNcm1qYUflMKSmSKC5nlVrgKWQJ3r7P4kL0B"
        let userId = "1859607209115619328"

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
