// GetTweetsSampleStreamRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/volume-streams/api-reference/get-tweets-sample-stream
open class GetTweetsSampleStreamRequestV2: TwitterAPIRequest {
    public let backfillMinutes: Int?
    public let expansions: Set<TwitterTweetExpansionsV2>?
    public let mediaFields: Set<TwitterMediaFieldsV2>?
    public let placeFields: Set<TwitterPlaceFieldsV2>?
    public let pollFields: Set<TwitterPollFieldsV2>?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/2/tweets/sample/stream"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        backfillMinutes.map { params["backfill_minutes"] = $0 }
        expansions?.bind(param: &params)
        mediaFields?.bind(param: &params)
        placeFields?.bind(param: &params)
        pollFields?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        backfillMinutes: Int? = .none,
        expansions: Set<TwitterTweetExpansionsV2>? = .none,
        mediaFields: Set<TwitterMediaFieldsV2>? = .none,
        placeFields: Set<TwitterPlaceFieldsV2>? = .none,
        pollFields: Set<TwitterPollFieldsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.backfillMinutes = backfillMinutes
        self.expansions = expansions
        self.mediaFields = mediaFields
        self.placeFields = placeFields
        self.pollFields = pollFields
        self.tweetFields = tweetFields
        self.userFields = userFields
    }

    deinit {
        // de-init logic here
    }
}
