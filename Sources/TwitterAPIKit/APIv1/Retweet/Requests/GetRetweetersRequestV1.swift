// GetRetweetersRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// post-and-engage/api-reference/get-statuses-retweeters-ids
open class GetRetweetersRequestV1: TwitterAPIRequest {
    public let tweetID: String
    public let cursor: String?
    public let stringifyIDs: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/statuses/retweeters/ids.json"
    }

    open var parameters: [String: Any] {
        var p = [String: Any]()
        p["id"] = tweetID
        cursor.map { p["cursor"] = $0 }
        stringifyIDs.map { p["stringify_ids"] = $0 }
        return p
    }

    public init(
        tweetID: String,
        cursor: String? = .none,
        stringifyIDs: Bool? = .none
    ) {
        self.tweetID = tweetID
        self.cursor = cursor
        self.stringifyIDs = stringifyIDs
    }

    deinit {
        // De-init Logic Here
    }
}
