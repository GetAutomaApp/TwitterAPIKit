// UploadMediaInitRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class UploadMediaInitRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = UploadMediaInitRequestV1(
            totalBytes: 10,
            mediaType: "image/jpg",
            mediaCategory: "c",
            additionalOwners: ["1", "2"]
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .upload)
        XCTAssertEqual(req.path, "/1.1/media/upload.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "command": "INIT",
                "total_bytes": 10,
                "media_type": "image/jpg",
                "media_category": "c",
                "additional_owners": "1,2",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
