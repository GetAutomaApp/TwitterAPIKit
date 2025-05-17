// PostDirectMessagesMarkReadRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/typing-indicator-and-read-receipts/api-reference/new-read-receipt
open class PostDirectMessagesMarkReadRequestV1: TwitterAPIRequest {
    /// Message ID
    public let lastReadEventID: String

    /// User ID
    public let recipientID: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/direct_messages/mark_read.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()

        params["last_read_event_id"] = lastReadEventID
        params["recipient_id"] = recipientID

        return params
    }

    public init(
        lastReadEventID: String,
        recipientID: String
    ) {
        self.lastReadEventID = lastReadEventID
        self.recipientID = recipientID
    }
    deinit {
        // de-init logic here
    }
}
