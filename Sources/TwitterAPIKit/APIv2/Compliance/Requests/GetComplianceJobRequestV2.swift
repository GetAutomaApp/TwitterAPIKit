// GetComplianceJobRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs-id
public struct GetComplianceJobRequestV2: TwitterAPIRequest {
    public let id: Int

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/compliance/jobs/\(id)"
    }

    public var parameters: [String: Any] {
        [:]
    }

    public init(
        id: Int
    ) {
        self.id = id
    }

}
