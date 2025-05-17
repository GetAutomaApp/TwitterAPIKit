// GetBlocksIDsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetBlocksIDsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetBlocksIDsRequestV1(
            stringifyIDs: true,
            cursor: "_c_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/blocks/ids.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "stringify_ids": true,
                "cursor": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetBlocksIDsRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
