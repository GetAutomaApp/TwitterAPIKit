// PostMediaSubtitlesDeleteRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostMediaSubtitlesDeleteRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostMediaSubtitlesDeleteRequestV1(
            mediaID: "m",
            mediaCategory: "c",
            subtitleLanguageCodes: ["l1", "l2"]
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/media/subtitles/delete.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "media_id": "m",
                "media_category": "c",
                "subtitle_info": [
                    "subtitles": [
                        ["language_code": "l1"],
                        ["language_code": "l2"],
                    ],
                ],
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
