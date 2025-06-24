// TwitterSearchTweetsSortOrderV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Sort order options for tweet search results
public enum TwitterSearchTweetsSortOrderV2: TwitterAPIv2RequestParameter, Sendable {
    /// Sort by recency (newest first)
    case recency
    /// Sort by relevancy (most relevant first)
    case relevancy

    public var stringValue: String {
        switch self {
        case .recency: "recency"
        case .relevancy: "relevancy"
        }
    }
}

/// Extension to bind sort order to request parameters
public extension TwitterSearchTweetsSortOrderV2 {
    /// Extension to bind sort order to request parameters
    func bind(param: inout [String: Any]) {
        param["sort_order"] = stringValue
    }
}
