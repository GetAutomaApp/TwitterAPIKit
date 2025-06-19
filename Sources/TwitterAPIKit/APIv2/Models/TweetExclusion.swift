// TweetExclusion.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents types of tweets that can be excluded from results
public enum TweetExclusion: TwitterAPIv2RequestParameter, Sendable {
    /// Exclude replies from results
    case replies
    /// Exclude retweets from results
    case retweets
    
    public var stringValue: String {
        switch self {
        case .replies: "replies"
        case .retweets: "retweets"
        }
    }
}

/// Extension to bind exclusions to request parameters
public extension Set<TweetExclusion> {
    func bind(param: inout [String: Any]) {
        param["exclude"] = commaSeparatedString
    }
} 