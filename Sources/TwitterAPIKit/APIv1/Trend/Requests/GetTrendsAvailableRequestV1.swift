// GetTrendsAvailableRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/
/// api-reference/get-trends-available
open class GetTrendsAvailableRequestV1: TwitterAPIRequest {
    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/trends/available.json"
    }

    open var parameters: [String: Any] {
        return [:]
    }

    public init() {}
    deinit {
        // de-init logic here
    }
}
