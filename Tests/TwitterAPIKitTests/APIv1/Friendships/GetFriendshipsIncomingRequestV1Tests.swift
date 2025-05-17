// GetFriendshipsIncomingRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetFriendshipsIncomingRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFriendshipsIncomingRequestV1(
            cursor: "_c_",
            stringifyIDs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/friendships/incoming.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "cursor": "_c_",
                "stringify_ids": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetFriendshipsIncomingRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
