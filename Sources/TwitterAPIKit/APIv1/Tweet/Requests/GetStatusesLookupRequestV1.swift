// GetStatusesLookupRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
open class GetStatusesLookupRequestV1: TwitterAPIRequest {
    public let ids: [String]
    public let map: Bool?
    public let trimUser: Bool?
    public let includeCardUri: Bool?
    public let includeEntities: Bool?
    public let includeExtAltText: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/statuses/lookup.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = ids.joined(separator: ",")
        map.map { params["map"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        includeCardUri.map { params["include_card_uri"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        includeExtAltText.map { params["include_ext_alt_text"] = $0 }
        return params
    }

    public init(
        ids: [String],
        map: Bool? = .none,
        trimUser: Bool? = .none,
        includeCardUri: Bool? = .none,
        includeEntities: Bool? = .none,
        includeExtAltText: Bool? = .none
    ) {
        self.ids = ids
        self.map = map
        self.trimUser = trimUser
        self.includeCardUri = includeCardUri
        self.includeEntities = includeEntities
        self.includeExtAltText = includeExtAltText
    }

    deinit {
        // de-init logic here
    }
}
