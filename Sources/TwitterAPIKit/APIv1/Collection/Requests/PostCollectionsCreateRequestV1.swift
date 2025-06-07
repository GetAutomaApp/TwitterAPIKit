// PostCollectionsCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/
/// curate-a-collection/api-reference/post-collections-create
public struct PostCollectionsCreateRequestV1: TwitterAPIRequest {
    public enum TimelineOrder: String, Sendable {
        case curationReverseChron = "curation_reverse_chron"
        case tweetChron = "tweet_chron"
        case tweetReverseChron = "tweet_reverse_chron"

        public func bind(param: inout [String: Any]) {
            param["timeline_order"] = rawValue
        }
    }

    public let name: String
    public let url: String?
    public let description: String?
    public let timelineOrder: TimelineOrder?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/collections/create.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        params["name"] = name
        url.map { params["url"] = $0 }
        description.map { params["description"] = $0 }
        timelineOrder?.bind(param: &params)
        return params
    }

    public init(
        name: String,
        url: String? = .none,
        description: String? = .none,
        timelineOrder: TimelineOrder? = .none
    ) {
        self.name = name
        self.url = url
        self.description = description
        self.timelineOrder = timelineOrder
    }

}
