import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list
open class GetMutesUsersListRequestV1: TwitterAPIRequest {
    public let cursor: String?
    public let includeEntities: Bool?
    public let skipStatus: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/mutes/users/list.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        cursor.map { params["cursor"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        return params
    }

    public init(
        cursor: String? = .none,
        includeEntities: Bool? = .none,
        skipStatus: Bool? = .none
    ) {
        self.cursor = cursor
        self.includeEntities = includeEntities
        self.skipStatus = skipStatus
    }
}
