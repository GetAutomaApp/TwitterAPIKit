// PostListsCreateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostListsCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsCreateRequestV1(
            name: "_n_",
            mode: .private,
            description: "_d_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "name": "_n_",
                "mode": "private",
                "description": "_d_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostListsCreateRequestV1(
            name: "n"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "name": "n",
            ]
        )
    }

}
