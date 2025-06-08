// TwitterAPIKitError.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents errors that can occur in the Twitter API Kit.
public enum TwitterAPIKitError: Error, Sendable {
    /// Represents specific reasons why a request might fail.
    public enum RequestFailureReason: Sendable {
        /// Indicates that a string could not be encoded to data.
        case cannotEncodeStringToData(string: String)
        /// Indicates that the URL is invalid.
        case invalidURL(url: String)
        /// Indicates that a parameter is invalid.
        case invalidParameter(parameter: String, cause: String)
        /// Indicates that JSON serialization failed.
        case jsonSerializationFailed(obj: String)
    }

    case requestFailed(reason: RequestFailureReason)
}

extension TwitterAPIKitError.RequestFailureReason {
    /// A localized description of the request failure reason.
    var localizedDescription: String {
        switch self {
        case let .cannotEncodeStringToData(string):
            "Could not encode string to data: \(string)"
        case let .invalidURL(url):
            "Invalid URL: \(url)"
        case let .invalidParameter(parameter, cause):
            "Invalid parameter '\(parameter)': \(cause)"
        case let .jsonSerializationFailed(obj):
            "JSON serialization failed for object: \(obj)"
        }
    }
}
