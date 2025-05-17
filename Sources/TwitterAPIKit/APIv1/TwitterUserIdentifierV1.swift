// TwitterUserIdentifierV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public enum TwitterUserIdentifierV1 {
    case userID(String)
    case screenName(String)
}

public enum TwitterUsersIdentifierV1 {
    case userIDs([String])
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
