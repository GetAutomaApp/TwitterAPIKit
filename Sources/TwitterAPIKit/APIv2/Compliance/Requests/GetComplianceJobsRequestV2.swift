// GetComplianceJobsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs
open class GetComplianceJobsRequestV2: TwitterAPIRequest {
    public enum Status: String {
        case created
        case inProgress = "in_progress"
        case failed
        case complete
        func bind(param: inout [String: Any]) {
            param["status"] = rawValue
        }
    }

    public let type: TwitterComplianceJobTypeV2
    public let status: Status?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/compliance/jobs"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        type.bind(param: &params)
        status?.bind(param: &params)
        return params
    }

    public init(
        type: TwitterComplianceJobTypeV2,
        status: Status? = .none
    ) {
        self.type = type
        self.status = status
    }
    deinit {
        // de-init logic here
    }
}
