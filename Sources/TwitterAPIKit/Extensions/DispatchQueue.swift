// DispatchQueue.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public extension DispatchQueue {
    /// A global queue used for processing Twitter API tasks with default QoS
    static var processQueue: DispatchQueue {
        .global(qos: .default)
    }
}
