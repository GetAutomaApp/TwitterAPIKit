import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs
open class GetComplianceJobsRequestV2: TwitterAPIRequest {
    public enum JobType: String {
        case tweets
        case users
        func bind(param: inout [String: Any]) {
            param["type"] = rawValue
        }
    }

    public enum Status: String {
        case created
        case inProgress = "in_progress"
        case failed
        case complete
        func bind(param: inout [String: Any]) {
            param["status"] = rawValue
        }
    }

    public let type: JobType
    public let status: Status?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/compliance/jobs"
    }

    open var parameters: [String: Any] {
        var p = [String: Any]()
        type.bind(param: &p)
        status?.bind(param: &p)
        return p
    }

    public init(
        type: JobType,
        status: Status? = .none
    ) {
        self.type = type
        self.status = status
    }
}
