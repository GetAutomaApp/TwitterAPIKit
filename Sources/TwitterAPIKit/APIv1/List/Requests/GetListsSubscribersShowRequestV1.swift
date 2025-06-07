// GetListsSubscribersShowRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/get-lists-subscribers-show
public struct GetListsSubscribersShowRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1
    public let user: TwitterUserIdentifierV1
    public let includeEntities: Bool?
    public let skipStatus: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/lists/subscribers/show.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        user.bind(param: &params)
        includeEntities.map { params["include_entities"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        return params
    }

    public init(
        list: TwitterListIdentifierV1,
        user: TwitterUserIdentifierV1,
        includeEntities: Bool? = .none,
        skipStatus: Bool? = .none
    ) {
        self.list = list
        self.user = user
        self.includeEntities = includeEntities
        self.skipStatus = skipStatus
    }

}
