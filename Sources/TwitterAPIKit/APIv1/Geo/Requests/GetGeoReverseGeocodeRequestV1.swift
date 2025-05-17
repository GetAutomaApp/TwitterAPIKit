// GetGeoReverseGeocodeRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-reverse_geocode
open class GetGeoReverseGeocodeRequestV1: TwitterAPIRequest {
    public let location: TwitterCoordinateV1
    public let accuracy: TwitterAccuracyV1?
    public let maxResults: Int?
    public let granularity: TwitterGranularityV1?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/geo/reverse_geocode.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        location.bind(param: &params)
        accuracy?.bind(param: &params)
        maxResults.map { params["max_results"] = $0 }
        granularity?.bind(param: &params)
        return params
    }

    public init(
        location: TwitterCoordinateV1,
        accuracy: TwitterAccuracyV1? = .none,
        maxResults: Int? = .none,
        granularity: TwitterGranularityV1? = .none
    ) {
        self.location = location
        self.accuracy = accuracy
        self.maxResults = maxResults
        self.granularity = granularity
    }
    deinit {
        // de-init logic here
    }
}
