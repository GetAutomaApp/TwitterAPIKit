// ComplianceAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class ComplianceAPIv2: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs-id
    public func getComplianceJob(
        _ request: GetComplianceJobRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/get-compliance-jobs
    public func getComplianceJobj(
        _ request: GetComplianceJobsRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/compliance/batch-compliance/api-reference/post-compliance-jobs
    public func createComplianceJob(
        _ request: PostComplianceJobsRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
