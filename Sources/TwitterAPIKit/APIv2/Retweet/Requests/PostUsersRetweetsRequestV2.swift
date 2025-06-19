import Foundation

public struct PostUsersRetweetsResponseV2: Decodable, Sendable {
    public struct Data: Decodable, Sendable {
        public let retweeted: Bool
    }
    public let data: Data
}

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request creates a retweet of a specific tweet by the authenticated user.
/// The response includes a confirmation of whether the retweet was successful.
/// Note: This endpoint requires OAuth 1.0a User Context authentication.
public struct PostUsersRetweetsRequestV2: TwitterAPIRequest {
    public typealias Response = PostUsersRetweetsResponseV2

    public let method: HTTPMethod = .post
    public let path: String
    public let parameters: [String: Any]

    public init(userId: String, tweetId: String) {
        self.path = "/2/users/\(userId)/retweets"
        self.parameters = ["tweet_id": tweetId]
    }

    public var bodyContentType: BodyContentType {
        .json
    }
} 