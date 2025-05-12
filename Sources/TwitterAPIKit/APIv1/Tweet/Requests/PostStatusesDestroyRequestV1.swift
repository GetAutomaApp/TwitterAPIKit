import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
open class PostStatusesDestroyRequestV1: TwitterAPIRequest {
    public let id: String
    public let trimUser: Bool?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/statuses/destroy/\(id).json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        trimUser.map { params["trim_user"] = $0 }
        return params
    }

    public init(
        id: String,
        trimUser: Bool? = .none
    ) {
        self.id = id
        self.trimUser = trimUser
    }
}
