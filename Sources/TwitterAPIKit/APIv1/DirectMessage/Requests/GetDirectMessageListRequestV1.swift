// GetDirectMessageListRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/list-events
public struct GetDirectMessageListRequestV1: TwitterAPIRequest {
    /// Max: 50
    public let count: Int?
    public let cursor: String?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/direct_messages/events/list.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()

        count.map { params["count"] = $0 }
        cursor.map { params["cursor"] = $0 }

        return params
    }

    public init(count: Int? = .none, cursor: String? = .none) {
        self.count = count
        self.cursor = cursor
    }

}
