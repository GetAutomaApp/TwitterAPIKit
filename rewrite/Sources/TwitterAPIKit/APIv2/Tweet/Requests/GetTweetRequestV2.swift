// GetTweetRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request retrieves a single tweet by its ID.
/// The response includes the tweet's content, metrics, and can be expanded to include
/// additional fields like author information, referenced tweets, and more.
public struct GetTweetRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterTweetResponseV2

    public let id: String
    public let expansions: Set<TwitterTweetExpansionsV2>?
    public let tweetFields: Set<TwitterTweetFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?
    public let mediaFields: Set<TwitterMediaFieldsV2>?
    public let placeFields: Set<TwitterPlaceFieldsV2>?
    public let pollFields: Set<TwitterPollFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/tweets/\(id)"
    }

    public var parameters: [String: Any] {
        var parameters: [String: Any] = [:]
        parameters["expansions"] = expansions?.map { $0.stringValue }.joined(separator: ",")
        parameters["tweet.fields"] = tweetFields?.map { $0.stringValue }.joined(separator: ",")
        parameters["user.fields"] = userFields?.map { $0.stringValue }.joined(separator: ",")
        parameters["media.fields"] = mediaFields?.map { $0.stringValue }.joined(separator: ",")
        parameters["place.fields"] = placeFields?.map { $0.stringValue }.joined(separator: ",")
        parameters["poll.fields"] = pollFields?.map { $0.stringValue }.joined(separator: ",")
        return parameters
    }

    public init(
        id: String,
        expansions: Set<TwitterTweetExpansionsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none,
        mediaFields: Set<TwitterMediaFieldsV2>? = .none,
        placeFields: Set<TwitterPlaceFieldsV2>? = .none,
        pollFields: Set<TwitterPollFieldsV2>? = .none
    ) {
        self.id = id
        self.expansions = expansions
        self.tweetFields = tweetFields
        self.userFields = userFields
        self.mediaFields = mediaFields
        self.placeFields = placeFields
        self.pollFields = pollFields
    }
} 