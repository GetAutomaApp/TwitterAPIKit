// PostComplianceJobsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/post-compliance-jobs
public struct PostComplianceJobsRequestV2: TwitterAPIRequest {
    public let type: TwitterComplianceJobTypeV2
    public let name: String?
    public let resumable: Bool?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/compliance/jobs"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        type.bind(param: &params)
        name.map { params["name"] = $0 }
        resumable.map { params["resumable"] = $0 }
        return params
    }

    public init(
        type: TwitterComplianceJobTypeV2,
        name: String? = .none,
        resumable: Bool? = .none
    ) {
        self.type = type
        self.name = name
        self.resumable = resumable
    }

}
