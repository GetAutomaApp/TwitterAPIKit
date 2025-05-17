// GetGeoSearchRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
open class GetGeoSearchRequestV1: TwitterAPIRequest {
    public enum Location {
        case coordinate(TwitterCoordinateV1)
        case query(String)
        case ip(String)
        func bind(param: inout [String: Any]) {
            switch self {
            case let .coordinate(twitterCoordinate):
                twitterCoordinate.bind(param: &param)
            case let .query(string):
                param["query"] = string
            case let .ip(string):
                param["ip"] = string
            }
        }
    }

    public let location: Location
    public let maxResults: Int?
    public let granularity: TwitterGranularityV1?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/geo/search.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        location.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        granularity?.bind(param: &params)
        return params
    }

    public init(
        location: Location,
        maxResults: Int? = .none,
        granularity: TwitterGranularityV1? = .none
    ) {
        self.location = location
        self.maxResults = maxResults
        self.granularity = granularity
    }
    deinit {
        // de-init logic here
    }
}
