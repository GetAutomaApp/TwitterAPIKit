// PostMediaMetadataCreateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostMediaMetadataCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostMediaMetadataCreateRequestV1(
            mediaID: "m",
            altText: "alt"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .upload)
        XCTAssertEqual(req.path, "/1.1/media/metadata/create.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "media_id": "m",
                "alt_text": ["text": "alt"],
            ]
        )
    }

}
