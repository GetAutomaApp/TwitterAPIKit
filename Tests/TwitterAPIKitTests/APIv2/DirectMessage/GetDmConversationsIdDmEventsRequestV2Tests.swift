// GetDmConversationsIdDmEventsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetDmConversationsIdDmEventsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetDmConversationsIdDmEventsRequestV2(
            id: "_i_",
            maxResults: 11,
            paginationToken: "_p_",
            eventTypes: [.messageCreate, .participantsJoin],
            dmEventFields: [.senderID],
            expansions: [.participantIDs],
            mediaFields: [.durationMs],
            userFields: [.id],
            tweetFields: [.text]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations/_i_/dm_events")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "max_results": 11,
                "pagination_token": "_p_",
                "event_types": "MessageCreate,ParticipantsJoin",
                "dm_event.fields": "sender_id",
                "expansions": "participant_ids",
                "media.fields": "duration_ms",
                "user.fields": "id",
                "tweet.fields": "text",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetDmConversationsIdDmEventsRequestV2(
            id: "i"
        )
        XCTAssertEqual(req.path, "/2/dm_conversations/i/dm_events")
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
