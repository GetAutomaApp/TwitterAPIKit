// Date.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

private let formatter = ISO8601DateFormatter()
extension Date {
    /// Converts the date to an ISO8601 formatted string
    /// - Returns: The date formatted as an ISO8601 string
    public func toISO8601String() -> String {
        return formatter.string(from: self)
    }

    /// Binds the date as an ISO8601 string to the provided parameters dictionary
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to
    ///   - key: The key to use for the date value
    public func bind(param: inout [String: Any], for key: String) {
        param[key] = toISO8601String()
    }
}
