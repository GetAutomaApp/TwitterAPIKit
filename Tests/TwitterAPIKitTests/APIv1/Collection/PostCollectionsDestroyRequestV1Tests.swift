// PostCollectionsDestroyRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostCollectionsDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsDestroyRequestV1(
            id: "_i_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
