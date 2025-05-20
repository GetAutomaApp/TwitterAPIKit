// GetTweetsSearchStreamRulesRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream
/// /api-reference/get-tweets-search-stream-rules
open class GetTweetsSearchStreamRulesRequestV2: TwitterAPIRequest {
    public let ids: [String]?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/tweets/search/stream/rules"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        ids.map { params["ids"] = $0.joined(separator: ",") }
        return params
    }

    public init(
        ids: [String]? = .none
    ) {
        self.ids = ids
    }

    deinit {
        // de-init logic here
    }
}
