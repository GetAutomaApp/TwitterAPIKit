// DirectMessageAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct DirectMessageAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/
    /// api-reference/get-dm_events
    public func getDmEvents(
        _ request: GetDmEventsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/
    /// api-reference/get-dm_conversations-with-participant_id-dm_events
    public func getDmEventsWithParticipantId(
        _ request: GetDmConversationsWithParticipantIdDmEventsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/lookup/
    /// api-reference/get-dm_conversations-dm_conversation_id-dm_events
    public func getDmEventsByConversationsId(
        _ request: GetDmConversationsIdDmEventsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/
    /// api-reference/post-dm_conversations-dm_conversation_id-messages
    public func postDmConversationById(
        _ request: PostDmConversationByIdRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/
    /// api-reference/post-dm_conversations-with-participant_id-messages
    public func postDmConversationWithUser(
        _ request: PostDmConversationWithUserRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/direct-messages/manage/
    /// api-reference/post-dm_conversations
    public func postDmConversation(
        _ request: PostDmConversationRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
