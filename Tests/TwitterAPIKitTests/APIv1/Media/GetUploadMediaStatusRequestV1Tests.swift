// GetUploadMediaStatusRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUploadMediaStatusRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetUploadMediaStatusRequestV1(mediaID: "m")

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/1.1/media/upload.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "command": "STATUS",
                "media_id": "m",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
