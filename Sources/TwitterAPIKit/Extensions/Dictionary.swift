// Dictionary.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public extension Dictionary {
    /// Converts the dictionary into a URL-encoded query string
    /// Format: key1=value1&key2=value2
    var urlEncodedQueryString: String {
        var parts = [String]()

        for (key, value) in self {
            let keyString = "\(key)".urlEncodedString
            let valueString = "\(value)".urlEncodedString
            let query = "\(keyString)=\(valueString)"
            parts.append(query)
        }

        return parts.joined(separator: "&")
    }
}
