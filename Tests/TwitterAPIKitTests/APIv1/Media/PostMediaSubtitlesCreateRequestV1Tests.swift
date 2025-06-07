// PostMediaSubtitlesCreateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostMediaSubtitlesCreateRequestV1Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = PostMediaSubtitlesCreateRequestV1(
            mediaID: "mediaID",
            mediaCategory: "c",
            subtitles: [
                .init(
                    mediaID: "subtitleMediaID",
                    languageCode: "l",
                    displayName: "d"
                ),
            ]
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .upload)
        XCTAssertEqual(req.path, "/1.1/media/subtitles/create.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "media_id": "mediaID",
                "media_category": "c",
                "subtitle_info": [
                    "subtitles": [
                        [
                            "media_id": "subtitleMediaID",
                            "language_code": "l",
                            "display_name": "d",
                        ],
                    ],
                ],
            ]
        )
    }

}
