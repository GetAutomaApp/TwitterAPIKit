import Foundation
import TwitterAPIKit

@main
internal struct GetUsersByIdsExample {
    /// EntryPoint
    public static func main() async throws {
        // Initialize the client with your credentials
        let client = TwitterAPISession(
            authenticationType: .oauth10a(
                consumerKey: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_KEY"] ?? "",
                consumerSecret: ProcessInfo.processInfo.environment["TWITTER_CONSUMER_SECRET"] ?? "",
                oauthToken: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN"] ?? "",
                oauthTokenSecret: ProcessInfo.processInfo.environment["TWITTER_OAUTH_TOKEN_SECRET"] ?? ""
            )
        )

        // Get multiple users by IDs
        let elonMuskID = "44196397"
        let twitterID = "783214"
        let usersRequest = GetUsersRequestV2(
            ids: [elonMuskID, twitterID],
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt, .text],
            userFields: [.name, .username, .profileImageUrl]
        )

        do {
            let response = try await client.send(usersRequest)
            for user in response.data {
                print("User: \(user.name) (@\(user.username))")
            }
        } catch {
            print("Error retrieving users: \(error)")
        }
    }
}
