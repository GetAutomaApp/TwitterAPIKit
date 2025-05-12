import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-show
open class GetUsersShowRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/users/show.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        includeEntities: Bool? = .none
    ) {
        self.user = user
        self.includeEntities = includeEntities
    }
}
