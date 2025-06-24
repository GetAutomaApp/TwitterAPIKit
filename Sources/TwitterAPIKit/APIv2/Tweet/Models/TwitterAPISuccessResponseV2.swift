// TwitterAPISuccessResponseV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Generic success response for Twitter API v2 endpoints that return a simple success object.
public struct TwitterAPISuccessResponseV2: Decodable, Sendable {
    public let data: SuccessData
    
    public struct SuccessData: Decodable, Sendable {
        public let retweeted: Bool?
        public let deleted: Bool?
    }
} 
