// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a context annotation in the Twitter API v2
public struct TwitterContextAnnotationV2: Decodable, Sendable {
    public let domain: Domain
    public let entity: Entity
    
    public struct Domain: Decodable, Sendable {
        public let id: String
        public let name: String
        public let description: String?
    }
    
    public struct Entity: Decodable, Sendable {
        public let id: String
        public let name: String
        public let description: String?
    }
} 