import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/post-users-id-likes
open class PostUsersLikesRequestV2: TwitterAPIRequest {
    /// user ID
    public let id: String
    public let tweetID: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/2/users/\(id)/likes"
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
