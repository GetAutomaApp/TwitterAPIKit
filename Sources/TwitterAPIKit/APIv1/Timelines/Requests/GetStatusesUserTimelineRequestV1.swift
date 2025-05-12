import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-user_timeline
open class GetStatusesUserTimelineRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let count: Int?
    public let maxID: String?
    public let sinceID: String?
    public let trimUser: Bool?
    public let includeRTs: Bool?
    public let excludeReplies: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/statuses/user_timeline.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        maxID.map { params["max_id"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        includeRTs.map { params["include_rts"] = $0 }
        excludeReplies.map { params["exclude_replies"] = $0 }
        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        maxID: String? = .none,
        sinceID: String? = .none,
        trimUser: Bool? = .none,
        includeRTs: Bool? = .none,
        excludeReplies: Bool? = .none
    ) {
        self.user = user
        self.count = count
        self.maxID = maxID
        self.sinceID = sinceID
        self.trimUser = trimUser
        self.includeRTs = includeRTs
        self.excludeReplies = excludeReplies
    }
}
