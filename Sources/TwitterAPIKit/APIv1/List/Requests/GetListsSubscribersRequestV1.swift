import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers
open class GetListsSubscribersRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let count: Int?
    public let cursor: String?
    public let includeEntities: Bool?
    public let skipStatus: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/lists/subscribers.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        return params
    }

    public init(
        list: TwitterListIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none,
        includeEntities: Bool? = .none,
        skipStatus: Bool? = .none
    ) {
        self.list = list
        self.count = count
        self.cursor = cursor
        self.includeEntities = includeEntities
        self.skipStatus = skipStatus
    }

    deinit {
        // De-init Logic Here
    }
}
