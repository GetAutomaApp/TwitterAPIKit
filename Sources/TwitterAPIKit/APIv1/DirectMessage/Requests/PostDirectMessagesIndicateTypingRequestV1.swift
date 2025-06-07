// PostDirectMessagesIndicateTypingRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
/// typing-indicator-and-read-receipts/api-reference/new-typing-indicator
public struct PostDirectMessagesIndicateTypingRequestV1: TwitterAPIRequest {
    public let recipientID: String

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/direct_messages/indicate_typing.json"
    }

    public var parameters: [String: Any] {
        ["recipient_id": recipientID]
    }

    public init(
        recipientID: String
    ) {
        self.recipientID = recipientID
    }

}
