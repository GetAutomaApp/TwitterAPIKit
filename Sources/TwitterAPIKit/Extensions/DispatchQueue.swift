// DispatchQueue.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

extension DispatchQueue {
    public static var processQueue: DispatchQueue {
        return .global(qos: .default)
    }
}
