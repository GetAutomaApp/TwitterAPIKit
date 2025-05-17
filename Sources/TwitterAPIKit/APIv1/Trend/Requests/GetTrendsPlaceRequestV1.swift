// GetTrendsPlaceRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place
open class GetTrendsPlaceRequestV1: TwitterAPIRequest {
    /// Where On Earth ID Global
    public let woeid: String

    /// exclude hshtags
    public let exclude: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/trends/place.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["woeid"] = woeid
        exclude.map { params["exclude"] = $0 }
        return params
    }

    public init(
        woeid: String,
        exclude: Bool? = .none
    ) {
        self.woeid = woeid
        self.exclude = exclude
    }
}
