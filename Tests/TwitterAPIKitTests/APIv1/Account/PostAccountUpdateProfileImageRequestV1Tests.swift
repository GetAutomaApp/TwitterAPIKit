// PostAccountUpdateProfileImageRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostAccountUpdateProfileImageRequestV1Tests: XCTestCase {
    public func test() throws {
        let image = Data([0, 1, 2])
        let req = PostAccountUpdateProfileImageRequestV1(
            image: image,
            skipStatus: true,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/account/update_profile_image.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "image": "AAEC",
                "skip_status": true,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let image = Data([0, 1, 2])
        let req = PostAccountUpdateProfileImageRequestV1(
            image: image
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "image": "AAEC",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
