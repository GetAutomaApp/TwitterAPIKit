// PostDmConversationWithUserRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Creates a new message for a DM Conversation with a participant user by ID
/// Required OAuth 2.0 scopes: dm.write, tweet.read, users.read
open class PostDmConversationWithUserRequestV2: TwitterAPIRequest {
    /// The ID of the recipient user that will receive the DM.
    public let participantID: String
    /// Attachments to a DM Event.
    public let attachments: [String]?
    /// Text of the message.
    public let text: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/dm_conversations/with/\(participantID)/messages"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        if let attachments {
            params["attachments"] = attachments.map { ["media_id": $0] }
        }
        text.map { params["text"] = $0 }
        return params
    }

    public init(
        participantID: String,
        attachments: [String]? = .none,
        text: String? = .none
    ) {
        self.participantID = participantID
        self.attachments = attachments
        self.text = text
    }

    deinit {
        // De-init Logic Here
    }
}
