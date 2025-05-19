// DeleteListRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id
open class DeleteListRequestV2: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        return .delete
    }

    public var path: String {
        return "/2/lists/\(id)"
    }

    open var parameters: [String: Any] {
        return [:]
    }

    public init(
        id: String
    ) {
        self.id = id
    }
    deinit {
        // de-init logic here
    }
}
