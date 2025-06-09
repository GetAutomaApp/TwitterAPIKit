import Foundation
import TwitterAPIKit

@main
struct GetUserByUsernameExample {
    static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
        )
        
        // Get user by username
        let elonMuskUsername = "elonmusk"
        let userByUsernameRequest = GetUsersByUsernameRequestV2(
            username: elonMuskUsername,
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(userByUsernameRequest)
            print("User: \(response.data.name) (@\(response.data.username))")
            if let pinnedTweet = response.includes?.tweets?.first {
                print("Pinned Tweet: \(pinnedTweet.text)")
            }
        } catch {
            print("Error retrieving user: \(error)")
        }
    }
} 