// TwitterUserIdentifierV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a way to identify a single Twitter user in the v1.1 API.
public enum TwitterUserIdentifierV1 {
    /// Identifies a user by their screen name (username).
    /// - Parameter String: The user's screen name without the @ symbol.
    case screenName(String)

    /// Identifies a user by their numeric user ID.
    /// - Parameter String: The user's unique numeric ID.
    case userID(String)
}

/// Represents a way to identify multiple Twitter users in the v1.1 API.
public enum TwitterUsersIdentifierV1 {
    /// Identifies multiple users by their screen names (usernames).
    /// - Parameter [String]: An array of screen names without the @ symbol.
    case screenNames([String])

    /// Identifies multiple users by their numeric user IDs.
    /// - Parameter [String]: An array of user IDs.
    case userIDs([String])
}

// MARK: - extensions

/// Extension to bind user identifier to request parameters
public extension TwitterUserIdentifierV1 {
    /// Binds the user identifier to the request parameters
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to
    ///   - userIDKey: The key to use for the user ID
    ///   - screenNameKey: The key to use for the screen name
    func bind(param: inout [String: Any], userIDKey: String = "user_id", screenNameKey: String = "screen_name") {
        switch self {
        case let .userID(string):
            param[userIDKey] = string
        case let .screenName(string):
            param[screenNameKey] = string
        }
    }
}

/// Extension to bind multiple user identifiers to request parameters
public extension TwitterUsersIdentifierV1 {
    /// Binds the multiple user identifiers to the request parameters
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to
    func bind(param: inout [String: Any]) {
        switch self {
        case let .userIDs(array):
            param["user_id"] = array.joined(separator: ",")
        case let .screenNames(array):
            param["screen_name"] = array.joined(separator: ",")
        }
    }
}
