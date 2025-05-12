import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/rate-limit-status/api-reference/get-application-rate_limit_status
open class GetApplicationRateLimitStatusRequestV1: TwitterAPIRequest {
    public let resources: [String]?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/application/rate_limit_status.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        resources.map { params["resources"] = $0.joined(separator: ",") }
        return params
    }

    public init(
        resources: [String]? = .none
    ) {
        self.resources = resources
    }
}
