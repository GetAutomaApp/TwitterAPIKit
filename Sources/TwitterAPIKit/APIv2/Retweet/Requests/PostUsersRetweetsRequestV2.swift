import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/retweets/api-reference/post-users-id-retweets
open class PostUsersRetweetsRequestV2: TwitterAPIRequest {
    public let id: String
    public let tweetID: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/2/users/\(id)/retweets"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["tweet_id"] = tweetID
        return params
    }

    public init(
        id: String,
        tweetID: String
    ) {
        self.id = id
        self.tweetID = tweetID
    }
}
