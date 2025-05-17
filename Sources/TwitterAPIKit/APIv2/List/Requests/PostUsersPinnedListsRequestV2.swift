// PostUsersPinnedListsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/post-users-id-pinned-lists
open class PostUsersPinnedListsRequestV2: TwitterAPIRequest {
    public let id: String
    public let listID: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/2/users/\(id)/pinned_lists"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["list_id"] = listID
        return params
    }

    public init(
        id: String,
        listID: String
    ) {
        self.id = id
        self.listID = listID
    }
}
