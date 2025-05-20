// TwitterSearchTweetsSortOrderV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public enum TwitterSearchTweetsSortOrderV2: String {
    case recency
    case relevancy

    public func bind(param: inout [String: Any]) {
        param["sort_order"] = rawValue
    }
}
