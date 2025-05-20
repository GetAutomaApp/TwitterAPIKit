// GetBlocksListRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetBlocksListRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetBlocksListRequestV1(
            includeEntities: true,
            skipStatus: true,
            cursor: "_c_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/blocks/list.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "include_entities": true,
                "skip_status": true,
                "cursor": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetBlocksListRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
