// TwitterListModeV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents the visibility mode of a Twitter list in API v1.1.
/// Lists can be either public (visible to all users) or private (visible only to the owner).
public enum TwitterListModeV1: Sendable {
    /// The list is private and only visible to its owner.
    case `private`

    /// The list is publicly visible to all Twitter users.
    case `public`
}

public extension TwitterListModeV1 {
    /// Binds the list mode to the request parameters.
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to.
    func bind(param: inout [String: Any]) {
        switch self {
        case .public:
            param["mode"] = "public"
        case .private:
            param["mode"] = "private"
        }
    }
}
