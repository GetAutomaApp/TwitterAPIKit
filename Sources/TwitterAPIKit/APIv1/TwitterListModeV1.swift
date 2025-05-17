// TwitterListModeV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// Represents the visibility mode of a Twitter list in API v1.1.
/// Lists can be either public (visible to all users) or private (visible only to the owner).
public enum TwitterListModeV1 {
    /// The list is publicly visible to all Twitter users.
    case `public`
    
    /// The list is private and only visible to its owner.
    case `private`
}

public extension TwitterListModeV1 {
    func bind(param: inout [String: Any]) {
        switch self {
        case .public:
            param["mode"] = "public"
        case .private:
            param["mode"] = "private"
        }
    }
}
