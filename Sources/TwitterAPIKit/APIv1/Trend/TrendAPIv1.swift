// TrendAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class TrendAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/
    /// trends-for-location/api-reference/get-trends-available
    public func getTrendsAvailable(
        _ request: GetTrendsAvailableRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/
    /// locations-with-trending-topics/api-reference/get-trends-closest
    public func getTrendsClosest(
        _ request: GetTrendsClosestRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/
    /// trends-for-location/api-reference/get-trends-place
    public func getTrends(
        _ request: GetTrendsPlaceRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
