// GetTrendsClosestRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/
/// api-reference/get-trends-closest
open class GetTrendsClosestRequestV1: TwitterAPIRequest {
    public let location: TwitterCoordinateV1

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/trends/closest.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        location.bind(param: &params)
        return params
    }

    public init(
        location: TwitterCoordinateV1
    ) {
        self.location = location
    }

    deinit {
        // de-init logic here
    }
}
