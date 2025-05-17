// GetSpaceRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id
open class GetSpaceRequestV2: TwitterAPIRequest {
    public let id: String
    public let expansions: Set<TwitterSpaceExpansionsV2>?
    public let spaceFields: Set<TwitterSpaceFieldsV2>?
    public let topicFields: Set<TwitterTopicFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/spaces/\(id)"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        expansions?.bind(param: &params)
        spaceFields?.bind(param: &params)
        topicFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        expansions: Set<TwitterSpaceExpansionsV2>? = .none,
        spaceFields: Set<TwitterSpaceFieldsV2>? = .none,
        topicFields: Set<TwitterTopicFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.spaceFields = spaceFields
        self.topicFields = topicFields
        self.userFields = userFields
    }
}
