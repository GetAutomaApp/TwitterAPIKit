// TwitterLocations.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public struct TwitterCoordinateV1 {
    public var lat: Double
    public var long: Double

    public init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }

    public func bind(param: inout [String: Any]) {
        param["lat"] = lat
        param["long"] = long
    }
}

public enum TwitterAccuracyV1 {
    /// meter
    case m(Int)
    /// feet
    case ft(Int)

    public func bind(param: inout [String: Any]) {
        switch self {
        case let .m(int):
            param["accuracy"] = "\(int)m"
        case let .ft(int):
            param["accuracy"] = "\(int)ft"
        }
    }
}

public enum TwitterGranularityV1: String {
    case neighborhood
    case city
    case admin
    case country

    public func bind(param: inout [String: Any]) {
        param["granularity"] = rawValue
    }
}
