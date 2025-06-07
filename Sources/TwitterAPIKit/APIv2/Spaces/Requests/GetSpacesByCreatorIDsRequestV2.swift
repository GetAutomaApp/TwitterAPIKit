// GetSpacesByCreatorIDsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-by-creator-ids
public struct GetSpacesByCreatorIDsRequestV2: TwitterAPIRequest {
    public let userIDs: [String]
    public let expansions: Set<TwitterSpaceExpansionsV2>?
    public let spaceFields: Set<TwitterSpaceFieldsV2>?
    public let topicFields: Set<TwitterTopicFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/spaces/by/creator_ids"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["user_ids"] = userIDs.joined(separator: ",")
        expansions?.bind(param: &params)
        spaceFields?.bind(param: &params)
        topicFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        userIDs: [String],
        expansions: Set<TwitterSpaceExpansionsV2>? = .none,
        spaceFields: Set<TwitterSpaceFieldsV2>? = .none,
        topicFields: Set<TwitterTopicFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.userIDs = userIDs
        self.expansions = expansions
        self.spaceFields = spaceFields
        self.topicFields = topicFields
        self.userFields = userFields
    }

}
