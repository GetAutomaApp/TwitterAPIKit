// PostDirectMessagesMarkReadRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostDirectMessagesMarkReadRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostDirectMessagesMarkReadRequestV1(lastReadEventID: "ev_id", recipientID: "r_id")

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/mark_read.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "last_read_event_id": "ev_id",
                "recipient_id": "r_id",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
