// DeleteUsersFollowedListsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/
/// api-reference/delete-users-id-followed-lists-list_id
open class DeleteUsersFollowedListsRequestV2: TwitterAPIRequest {
    public let id: String
    public let listID: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/2/users/\(id)/followed_lists/\(listID)"
    }

    open var parameters: [String: Any] {
        [:]
    }

    public init(
        id: String,
        listID: String
    ) {
        self.id = id
        self.listID = listID
    }

    deinit {
        // de-init logic here
    }
}
