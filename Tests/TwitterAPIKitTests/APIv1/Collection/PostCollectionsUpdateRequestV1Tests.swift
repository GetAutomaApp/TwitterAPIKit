// PostCollectionsUpdateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostCollectionsUpdateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsUpdateRequestV1(
            id: "_i_",
            url: "_u_",
            name: "_n_",
            description: "_d_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/update.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "url": "_u_",
                "name": "_n_",
                "description": "_d_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostCollectionsUpdateRequestV1(
            id: "i"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "i",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
