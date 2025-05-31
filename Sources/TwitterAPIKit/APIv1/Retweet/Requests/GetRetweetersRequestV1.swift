// GetRetweetersRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// post-and-engage/api-reference/get-statuses-retweeters-ids
open class GetRetweetersRequestV1: TwitterAPIRequest {
    // Status ID
    public let tweetID: String
    public let count: Int?
    public let cursor: String?
    public let stringifyIDs: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {

        return "/1.1/statuses/retweeters/ids.json"
    }

    open var parameters: [String: Any] {

        var params = [String: Any]()

        params["id"] = tweetID
        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }
        stringifyIDs.map { params["stringify_ids"] = $0 }

        return params
    }

    public init(
        tweetID: String,
        count: Int? = .none,
        cursor: String? = .none,
        stringifyIDs: Bool? = .none
    ) {
        self.tweetID = tweetID
        self.count = count
        self.cursor = cursor
        self.stringifyIDs = stringifyIDs
    }

    deinit {
        // De-init Logic Here
    }
}
