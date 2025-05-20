// GetDirectMessageRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetDirectMessageRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetDirectMessageRequestV1(id: "dm_id")

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, ["id": "dm_id"])
    }

    deinit {
        // De-init Logic Here
    }
}
