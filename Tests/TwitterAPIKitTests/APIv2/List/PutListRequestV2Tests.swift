// PutListRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PutListRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PutListRequestV2(
            id: "_id_",
            description: "d",
            name: "n",
            private: true
        )

        XCTAssertEqual(req.method, .put)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "description": "d",
                "name": "n",
                "private": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PutListRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
