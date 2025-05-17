// TwitterUserIdentifierV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// Represents a way to identify a single Twitter user in the v1.1 API.
public enum TwitterUserIdentifierV1 {
    /// Identifies a user by their numeric user ID.
    /// - Parameter String: The user's unique numeric ID.
    case userID(String)
    
    /// Identifies a user by their screen name (username).
    /// - Parameter String: The user's screen name without the @ symbol.
    case screenName(String)
}

/// Represents a way to identify multiple Twitter users in the v1.1 API.
public enum TwitterUsersIdentifierV1 {
    /// Identifies multiple users by their numeric user IDs.
    /// - Parameter [String]: An array of user IDs.
    case userIDs([String])
    
    /// Identifies multiple users by their screen names (usernames).
    /// - Parameter [String]: An array of screen names without the @ symbol.
    case screenNames([String])
}

// MARK: - extensions

extension TwitterUserIdentifierV1 {
    func bind(param: inout [String: Any], userIDKey: String = "user_id", screenNameKey: String = "screen_name") {
        switch self {
        case let .userID(string):
            param[userIDKey] = string
        case let .screenName(string):
            param[screenNameKey] = string
        }
    }
}

extension TwitterUsersIdentifierV1 {
    func bind(param: inout [String: Any]) {
        switch self {
        case let .userIDs(array):
            param["user_id"] = array.joined(separator: ",")
        case let .screenNames(array):
            param["screen_name"] = array.joined(separator: ",")
        }
    }
}
