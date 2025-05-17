// GetSavedSearchesListRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list
open class GetSavedSearchesListRequestV1: TwitterAPIRequest {
    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/saved_searches/list.json"
    }

    open var parameters: [String: Any] {
        return [:]
    }

    public init() {}

    deinit {
        // De-init Logic Here
    }
}
