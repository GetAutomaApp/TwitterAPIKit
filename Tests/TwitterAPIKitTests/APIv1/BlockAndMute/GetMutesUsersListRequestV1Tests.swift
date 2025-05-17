// GetMutesUsersListRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetMutesUsersListRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetMutesUsersListRequestV1(
            cursor: "_c_",
            includeEntities: true,
            skipStatus: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/mutes/users/list.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "cursor": "_c_",
                "include_entities": true,
                "skip_status": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetMutesUsersListRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
