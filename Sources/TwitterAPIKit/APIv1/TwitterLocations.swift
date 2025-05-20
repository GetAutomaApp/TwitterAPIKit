// TwitterLocations.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// A protocol that represents a location in the Twitter API v1
public protocol TwitterLocations {
    // No Logic Here
}

/// Represents geographical coordinates in the Twitter API v1
public struct TwitterCoordinateV1: TwitterLocations {
    /// The latitude coordinate
    public var lat: Double
    /// The longitude coordinate
    public var long: Double

    /// Creates a new coordinate with the specified latitude and longitude
    public init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }

    /// Binds the coordinate values to the provided parameters dictionary
    public func bind(param: inout [String: Any]) {
        param["lat"] = lat
        param["long"] = long
    }
}

/// Represents accuracy levels for geographical locations
public enum TwitterAccuracyV1: TwitterLocations {
    // swiftlint:disable identifier_name
    /// Accuracy in feet
    case ft(Int)
    /// Accuracy in meters
    case m(Int)

    /// Binds the accuracy value to the provided parameters dictionary
    public func bind(param: inout [String: Any]) {
        switch self {
        case let .m(int):
            param["accuracy"] = "\(int)m"
        case let .ft(int):
            param["accuracy"] = "\(int)ft"
        }
    }
}

// swiftlint:enable identifier_name

/// Represents the granularity level for geographical locations
public enum TwitterGranularityV1: String {
    /// Administrative level granularity
    case admin
    /// City level granularity
    case city
    /// Country levelk granularity
    case country
    /// Neighborhood level granularity
    case neighborhood

    /// Binds the granularity value to the provided parameters dictionary
    public func bind(param: inout [String: Any]) {
        param["granularity"] = rawValue
    }
}
