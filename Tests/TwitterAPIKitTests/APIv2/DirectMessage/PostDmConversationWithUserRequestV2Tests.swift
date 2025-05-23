// PostDmConversationWithUserRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostDmConversationWithUserRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostDmConversationWithUserRequestV2(
            participantID: "_p_",
            attachments: ["10"],
            text: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations/with/_p_/messages")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "attachments": [["media_id": "10"]],
                "text": "_t_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostDmConversationWithUserRequestV2(
            participantID: "_p_id"
        )

        XCTAssertEqual(req.path, "/2/dm_conversations/with/_p_id/messages")
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
