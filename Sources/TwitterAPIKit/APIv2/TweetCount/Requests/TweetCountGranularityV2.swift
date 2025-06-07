// TweetCountGranularityV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public enum TweetCountGranularityV2: String, Sendable {
    case day
    case hour
    case minute

    public func bind(param: inout [String: Any]) {
        param["granularity"] = rawValue
    }
}
