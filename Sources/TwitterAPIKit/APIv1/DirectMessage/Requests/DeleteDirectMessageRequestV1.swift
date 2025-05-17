// DeleteDirectMessageRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/delete-message-event
open class DeleteDirectMessageRequestV1: TwitterAPIRequest {
    public let id: String

    public var method: HTTPMethod {
        return .delete
    }

    public var path: String {
        return "/1.1/direct_messages/events/destroy.json"
    }

    open var parameters: [String: Any] {
        return [
            "id": id,
        ]
    }

    public init(id: String) {
        self.id = id
    }
    deinit {
        // de-init logic here
    }
}
