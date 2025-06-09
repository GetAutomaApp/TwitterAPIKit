import Foundation
import TwitterAPIKit

@main
struct GetUserByIdExample {
    static func main() async throws {
        let client = TwitterAPISession(
            consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
            consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
            oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
            oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
        )
        
        let elonMuskID = "44196397"
        let userRequest = GetUserRequestV2(
            id: elonMuskID,
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )
        
        do {
            let response = try await client.send(userRequest)
            print("User: \(response.data.name) (@\(response.data.username)) \(response.data.profileImageUrl ?? "")")
            if let pinnedTweet = response.includes?.tweets?.first {
                print("Pinned Tweet: \(pinnedTweet.text)")
            }
        } catch {
            print("Error retrieving user: \(error)")
        }
    }
} 