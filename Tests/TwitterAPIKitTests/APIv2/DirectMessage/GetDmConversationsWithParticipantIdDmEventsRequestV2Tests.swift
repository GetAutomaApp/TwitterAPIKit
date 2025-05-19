// GetDmConversationsWithParticipantIdDmEventsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

// swiftlint:disable:next type_name
internal class GetDmConversationsWithParticipantIdDmEventsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetDmConversationsWithParticipantIdDmEventsRequestV2(
            participantID: "_p_id",
            maxResults: 12,
            paginationToken: "_p_",
            eventTypes: [.participantsLeave],
            dmEventFields: [.eventType],
            expansions: [.attachmentsMediaKeys],
            mediaFields: [],
            userFields: [],
            tweetFields: []
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations/with/_p_id/dm_events")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "max_results": 12,
                "pagination_token": "_p_",
                "event_types": "ParticipantsLeave",
                "dm_event.fields": "event_type",
                "expansions": "attachments.media_keys",
                "media.fields": "",
                "user.fields": "",
                "tweet.fields": "",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetDmConversationsWithParticipantIdDmEventsRequestV2(
            participantID: "p"
        )

        XCTAssertEqual(req.path, "/2/dm_conversations/with/p/dm_events")
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
