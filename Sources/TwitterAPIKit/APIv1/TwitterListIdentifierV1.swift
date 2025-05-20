// TwitterListIdentifierV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents different ways to identify a Twitter list in API v1.1.
/// Lists can be identified either by their unique ID or by a combination of slug and owner.
public enum TwitterListIdentifierV1 {
    /// Identifies a list by its unique numeric ID.
    /// - Parameter listID: The unique identifier of the list.
    case listID(String)

    /// Identifies a list by its slug (URL-friendly name) and owner.
    /// - Parameters:
    ///   - slug: The URL-friendly name of the list.
    ///   - owner: The identifier of the list's owner.
    case slug(slug: String, owner: TwitterUserIdentifierV1)
}

public extension TwitterListIdentifierV1 {
    /// Binds the list identifier to the request parameters.
    /// - Parameters:
    ///   - param: The parameters dictionary to bind to.
    func bind(param: inout [String: Any]) {
        switch self {
        case let .listID(string):
            param["list_id"] = string
        case let .slug(slug, owner):
            param["slug"] = slug
            switch owner {
            case let .userID(string):
                param["owner_id"] = string
            case let .screenName(string):
                param["owner_screen_name"] = string
            }
        }
    }
}
