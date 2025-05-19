// TwitterTimelineExcludeV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// The types of items to exclude from the timeline.
public enum TwitterTimelineExcludeV2: String, TwitterAPIv2RequestParameter {
    /// Exclude replies from the timeline.
    case replies
    /// Exclude retweets from the timeline.
    case retweets

    /// The string value of the exclude type.
    public var stringValue: String {
        return rawValue
    }
}

/// Extension to bind the exclude types to the request parameters.
extension Set where Element == TwitterTimelineExcludeV2 {
    /// Binds the exclude types to the request parameters.
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to.
    public func bind(param: inout [String: Any]) {
        param["exclude"] = commaSeparatedString
    }
}
