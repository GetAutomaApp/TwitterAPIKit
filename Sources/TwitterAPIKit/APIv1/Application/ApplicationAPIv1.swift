// ApplicationAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct ApplicationAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }
    
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/
    /// rate-limit-status/api-reference/get-application-rate_limit_status
    public func getRateLimit(
        _ request: GetApplicationRateLimitStatusRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
