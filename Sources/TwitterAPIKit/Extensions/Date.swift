// Date.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

private let formatter = ISO8601DateFormatter()
extension Date {
    func toISO8601String() -> String {
        return formatter.string(from: self)
    }

    func bind(param: inout [String: Any], for key: String) {
        param[key] = toISO8601String()
    }
}
