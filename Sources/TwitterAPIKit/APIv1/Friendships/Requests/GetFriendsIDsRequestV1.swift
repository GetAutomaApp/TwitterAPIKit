import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids
open class GetFriendsIDsRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let count: Int?
    public let cursor: String?
    public let stringifyIDs: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/friends/ids.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        stringifyIDs.map { params["stringify_ids"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none,
        stringifyIDs: Bool? = .none
    ) {
        self.user = user
        self.count = count
        self.cursor = cursor
        self.stringifyIDs = stringifyIDs
    }
}
