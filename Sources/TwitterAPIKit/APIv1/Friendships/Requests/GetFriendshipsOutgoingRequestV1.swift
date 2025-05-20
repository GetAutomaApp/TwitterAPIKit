// GetFriendshipsOutgoingRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// follow-search-get-users/api-reference/get-friendships-outgoing
open class GetFriendshipsOutgoingRequestV1: TwitterAPIRequest {
    public let cursor: String?
    public let stringifyIDs: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/friendships/outgoing"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        cursor.map { params["cursor"] = $0 }
        stringifyIDs.map { params["stringify_ids"] = $0 }
        return params
    }

    public init(
        cursor: String? = .none,
        stringifyIDs: Bool? = .none
    ) {
        self.cursor = cursor
        self.stringifyIDs = stringifyIDs
    }

    deinit {
        // de-init logic here
    }
}
