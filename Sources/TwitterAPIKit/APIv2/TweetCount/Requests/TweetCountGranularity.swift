// TweetCountGranularity.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public enum TweetCountGranularityV2: String {
    case minute
    case hour
    case day

    func bind(param: inout [String: Any]) {
        param["granularity"] = rawValue
    }
}
