import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create
open class PostFriendshipsCreateRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let follow: Bool?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/friendships/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        follow.map { params["follow"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        follow: Bool? = .none
    ) {
        self.user = user
        self.follow = follow
    }
}
