// ComplianceAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct ComplianceAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/
    /// api-reference/get-compliance-jobs-id
    public func getComplianceJob(
        _ request: GetComplianceJobRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/
    /// api-reference/get-compliance-jobs
    public func getComplianceJobj(
        _ request: GetComplianceJobsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/
    /// api-reference/post-compliance-jobs
    public func createComplianceJob(
        _ request: PostComplianceJobsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
