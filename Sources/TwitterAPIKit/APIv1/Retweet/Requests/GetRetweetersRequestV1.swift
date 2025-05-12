import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweeters-ids
open class GetRetweetersRequestV1: TwitterAPIRequest {
    // Status ID
    let id: String
    let count: Int?
    let cursor: String?
    let stringifyIDs: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/statuses/retweeters/ids.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()

        params["id"] = id
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        stringifyIDs.map { params["stringify_ids"] = $0 }

        return params
    }

    public init(
        id: String,
        count: Int? = .none,
        cursor: String? = .none,
        stringifyIDs: Bool? = .none
    ) {
        self.id = id
        self.count = count
        self.cursor = cursor
        self.stringifyIDs = stringifyIDs
    }
}
