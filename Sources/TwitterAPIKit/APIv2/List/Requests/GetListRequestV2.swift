// GetListRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-lists-id
public struct GetListRequestV2: TwitterAPIRequest {
    public let id: String
    public let expansions: Set<TwitterListExpansionsV2>?
    public let listFields: Set<TwitterListFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/lists/\(id)"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        expansions?.bind(param: &params)
        listFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        expansions: Set<TwitterListExpansionsV2>? = .none,
        listFields: Set<TwitterListFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.listFields = listFields
        self.userFields = userFields
    }

}
