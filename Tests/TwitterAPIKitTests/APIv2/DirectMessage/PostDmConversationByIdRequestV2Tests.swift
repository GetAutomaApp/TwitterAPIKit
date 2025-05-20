// PostDmConversationByIdRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostDmConversationByIdRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostDmConversationByIdRequestV2(
            dmConversationID: "_d_id",
            attachments: ["1", "2"],
            text: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations/_d_id/messages")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "attachments": [["media_id": "1"], ["media_id": "2"]],
                "text": "_t_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostDmConversationByIdRequestV2(
            dmConversationID: "_d_"
        )

        XCTAssertEqual(req.path, "/2/dm_conversations/_d_/messages")
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
