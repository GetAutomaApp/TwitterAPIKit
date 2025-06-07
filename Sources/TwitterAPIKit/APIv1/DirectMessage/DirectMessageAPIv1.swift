// DirectMessageAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct DirectMessageAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// sending-and-receiving/api-reference/new-event
    public func postDirectMessage(
        _ request: PostDirectMessageRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// sending-and-receiving/api-reference/delete-message-event
    public func deleteDirectMessage(
        _ request: DeleteDirectMessageRequestV1
    ) -> TwitterAPISessionDataTask { // 204 - No Content
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// sending-and-receiving/api-reference/get-event
    public func getDirectMessage(
        _ request: GetDirectMessageRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// sending-and-receiving/api-reference/list-events
    public func getDirectMessageList(
        _ request: GetDirectMessageListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// typing-indicator-and-read-receipts/api-reference/new-read-receipt
    public func postDirectMessageMarkRead(
        _ request: PostDirectMessagesMarkReadRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/
    /// typing-indicator-and-read-receipts/api-reference/new-typing-indicator
    public func postDirectMessageTypingIndicator(
        _ request: PostDirectMessagesIndicateTypingRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

}
