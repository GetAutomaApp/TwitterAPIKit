// TwitterTimelineExcludeV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// The types of items to exclude from the timeline.
public enum TwitterTimelineExcludeV2: String, TwitterAPIv2RequestParameter {
    /// Exclude replies from the timeline.
    case replies
    /// Exclude retweets from the timeline.
    case retweets

    /// The string value of the exclude type.
    public var stringValue: String {
        rawValue
    }
}

/// Extension to bind the exclude types to the request parameters.
public extension Set<TwitterTimelineExcludeV2> {
    /// Binds the exclude types to the request parameters.
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to.
    func bind(param: inout [String: Any]) {
        param["exclude"] = commaSeparatedString
    }
}
