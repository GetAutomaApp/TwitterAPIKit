// PostDmConversationRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostDmConversationRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostDmConversationRequestV2(
            conversationType: .group,
            participantIDs: ["a", "b"],
            attachments: ["2", "3"],
            text: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "conversation_type": "Group",
                "participant_ids": ["a", "b"],
                "message": [
                    "attachments": [["media_id": "2"], ["media_id": "3"]],
                    "text": "_t_",
                ],
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostDmConversationRequestV2(
            conversationType: .group,
            participantIDs: ["a", "b", "c"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "conversation_type": "Group",
                "participant_ids": ["a", "b", "c"],
                "message": [:],
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
