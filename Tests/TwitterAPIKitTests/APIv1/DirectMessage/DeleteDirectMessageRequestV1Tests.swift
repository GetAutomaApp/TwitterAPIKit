// DeleteDirectMessageRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class DeleteDirectMessageRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = DeleteDirectMessageRequestV1(id: "15")
        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, ["id": "15"])
        AssertEqualAnyDict(req.queryParameters, ["id": "15"])
    }

    deinit {
        // De-init Logic Here
    }
}
