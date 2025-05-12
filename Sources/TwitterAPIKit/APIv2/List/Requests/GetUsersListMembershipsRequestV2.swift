import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-users-id-list_memberships
open class GetUsersListMembershipsRequestV2: TwitterAPIRequest {
    /// User ID
    public let id: String
    public let expansions: Set<TwitterListExpansionsV2>?
    public let listFields: Set<TwitterListFieldsV2>?
    public let maxResults: Int?
    public let paginationToken: String?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/users/\(id)/list_memberships"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        expansions?.bind(param: &params)
        listFields?.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        paginationToken.map { params["pagination_token"] = $0 }
        userFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        expansions: Set<TwitterListExpansionsV2>? = .none,
        listFields: Set<TwitterListFieldsV2>? = .none,
        maxResults: Int? = .none,
        paginationToken: String? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.listFields = listFields
        self.maxResults = maxResults
        self.paginationToken = paginationToken
        self.userFields = userFields
    }
}
