// UploadMediaFinalizeRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class UploadMediaFinalizeRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = UploadMediaFinalizeRequestV1(mediaID: "m")

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .upload)
        XCTAssertEqual(req.path, "/1.1/media/upload.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "command": "FINALIZE",
                "media_id": "m",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
