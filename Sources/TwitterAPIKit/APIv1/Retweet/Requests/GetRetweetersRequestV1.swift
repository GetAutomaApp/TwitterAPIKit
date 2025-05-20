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
    public let tweetID: String
    public let cursor: String?
    public let stringifyIDs: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/statuses/retweeters/ids.json"
    }

    open var parameters: [String: Any] {
        var parameters = [String: Any]()
        parameters["id"] = tweetID
        cursor.map { parameters["cursor"] = $0 }
        stringifyIDs.map { parameters["stringify_ids"] = $0 }
        return parameters
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
