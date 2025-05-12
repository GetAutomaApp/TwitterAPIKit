import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
open class GetListsSubscriptionsRequestV1: TwitterAPIRequest {
    let user: TwitterUserIdentifierV1
    let count: Int?
    let cursor: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/lists/subscriptions.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none
    ) {
        self.user = user
        self.count = count
        self.cursor = cursor
    }
}
