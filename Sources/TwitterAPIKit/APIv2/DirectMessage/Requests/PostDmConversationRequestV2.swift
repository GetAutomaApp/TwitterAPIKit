// PostDmConversationRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Creates a new DM Conversation.
/// Required OAuth 2.0 scopes: dm.write, tweet.read, users.read
open class PostDmConversationRequestV2: TwitterAPIRequest {
    /// The conversation type that is being created.
    public enum ConversationType: String {
        case group = "Group"
    }

    /// The conversation type that is being created.
    public let conversationType: ConversationType
    /// Participants for the DM Conversation.
    public let participantIDs: [String]
    /// Attachments to a DM Event.
    public let attachments: [String]?
    /// Text of the message.
    public let text: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/dm_conversations"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["conversation_type"] = conversationType.rawValue
        params["participant_ids"] = participantIDs
        var message = [String: Any]()
        text.map { message["text"] = $0 }
        if let attachments {
            message["attachments"] = attachments.map { ["media_id": $0] }
        }
        params["message"] = message
        return params
    }

    public init(
        conversationType: ConversationType,
        participantIDs: [String],
        attachments: [String]? = .none,
        text: String? = .none
    ) {
        self.conversationType = conversationType
        self.participantIDs = participantIDs
        self.attachments = attachments
        self.text = text
    }

    deinit {
        // De-init Logic Here
    }
}
