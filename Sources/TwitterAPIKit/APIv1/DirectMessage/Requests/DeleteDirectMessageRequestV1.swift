// DeleteDirectMessageRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
/// sending-and-receiving/api-reference/delete-message-event
public struct DeleteDirectMessageRequestV1: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        .delete
    }

    public var path: String {
        "/1.1/direct_messages/events/destroy.json"
    }

    public var parameters: [String: Any] {
        [
            "id": id,
        ]
    }

    public init(id: String) {
        self.id = id
    }

}
