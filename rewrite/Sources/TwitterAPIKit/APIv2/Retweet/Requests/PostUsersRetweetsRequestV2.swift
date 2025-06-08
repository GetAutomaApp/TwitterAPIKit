import Foundation

public struct PostUsersRetweetsResponseV2: Decodable, Sendable {
    public struct Data: Decodable, Sendable {
        public let retweeted: Bool
    }
    public let data: Data
}

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