// PostCollectionsCreateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostCollectionsCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsCreateRequestV1(
            name: "_n_",
            url: "_u_",
            description: "_d_",
            timelineOrder: .curationReverseChron
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "name": "_n_",
                "url": "_u_",
                "description": "_d_",
                "timeline_order": "curation_reverse_chron",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostCollectionsCreateRequestV1(
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
