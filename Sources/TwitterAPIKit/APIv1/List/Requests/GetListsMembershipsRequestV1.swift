// GetListsMembershipsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/get-lists-memberships
open class GetListsMembershipsRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1
    public let count: Int?
    public let cursor: String?
    public let filterToOwnedLists: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/lists/memberships.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        filterToOwnedLists.map { params["filter_to_owned_lists"] = $0 }

        return params
    }

    public init(
        user: TwitterUserIdentifierV1,
        count: Int? = .none,
        cursor: String? = .none,
        filterToOwnedLists: Bool? = .none
    ) {
        self.user = user
        self.count = count
        self.cursor = cursor
        self.filterToOwnedLists = filterToOwnedLists
    }

    deinit {
        // De-init Logic Here
    }
}
