// PostListsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostListsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostListsRequestV2(
            name: "_name_",
            description: "d",
            private: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "name": "_name_",
                "description": "d",
                "private": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostListsRequestV2(
            name: "n"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "name": "n",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
