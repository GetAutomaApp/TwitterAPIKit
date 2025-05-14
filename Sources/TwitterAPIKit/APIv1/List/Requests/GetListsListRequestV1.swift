import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
open class GetListsListRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let reverse: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/lists/list.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        reverse.map { params["reverse"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        reverse: Bool? = .none
    ) {
        self.user = user
        self.reverse = reverse
    }

    deinit {
        // De-init Logic Here
    }
}
