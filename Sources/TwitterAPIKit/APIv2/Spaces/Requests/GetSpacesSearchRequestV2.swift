// GetSpacesSearchRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/spaces/search/api-reference/get-spaces-search
open class GetSpacesSearchRequestV2: TwitterAPIRequest {
    public enum State: String {
        case all
        case live
        case scheduled
        public func bind(param: inout [String: Any]) {
            param["state"] = rawValue
        }
    }

    public let query: String
    public let expansions: Set<TwitterSpaceExpansionsV2>?
    public let spaceFields: Set<TwitterSpaceFieldsV2>?
    public let state: State?
    public let topicFields: Set<TwitterTopicFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/spaces/search"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["query"] = query
        expansions?.bind(param: &params)
        spaceFields?.bind(param: &params)
        state?.bind(param: &params)
        topicFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        query: String,
        expansions: Set<TwitterSpaceExpansionsV2>? = .none,
        spaceFields: Set<TwitterSpaceFieldsV2>? = .none,
        state: State? = .none,
        topicFields: Set<TwitterTopicFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.query = query
        self.expansions = expansions
        self.spaceFields = spaceFields
        self.state = state
        self.topicFields = topicFields
        self.userFields = userFields
    }

    deinit {
        // de-init logic here
    }
}
