import Foundation
import TwitterAPIKit

@main
struct GetUsersByUsernamesExample {
    static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
        )
        
        // Get multiple users by usernames
        let elonMuskUsername = "elonmusk"
        let twitterUsername = "twitter"
        let usersByUsernamesRequest = GetUsersByRequestV2(
            usernames: [elonMuskUsername, twitterUsername],
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(usersByUsernamesRequest)
            for user in response.data {
                print("User: \(user.name) (@\(user.username))")
            }
        } catch {
            print("Error retrieving users: \(error)")
        }
    }
} 