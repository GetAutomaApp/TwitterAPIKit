import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids
open class GetMutesUsersIDsRequestV1: TwitterAPIRequest {
    public let stringifyIDs: Bool?
    public let cursor: String?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/mutes/users/ids.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        stringifyIDs.map { params["stringify_ids"] = $0 }
        cursor.map { params["cursor"] = $0 }
        return params
    }

    public init(
        stringifyIDs: Bool? = .none,
        cursor: String? = .none
    ) {
        self.stringifyIDs = stringifyIDs
        self.cursor = cursor
    }
}
