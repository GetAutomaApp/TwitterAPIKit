import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-search
open class GetUsersSearchRequestV1: TwitterAPIRequest {
    public let query: String
    public let page: Int?
    public let count: Int?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/users/search.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["q"] = query
        page.map { params["page"] = $0 }
        count.map { params["count"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        query: String,
        page: Int? = .none,
        count: Int? = .none,
        includeEntities: Bool? = .none
    ) {
        self.query = query
        self.page = page
        self.count = count
        self.includeEntities = includeEntities
    }

    deinit {
        // De-init Logic Here
    }
}
