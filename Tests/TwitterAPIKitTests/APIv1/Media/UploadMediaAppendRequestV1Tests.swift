// UploadMediaAppendRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class UploadMediaAppendRequestV1Tests: XCTestCase {
    public func test() throws {
        let data = Data()
        let req = UploadMediaAppendRequestV1(
            mediaID: "m",
            filename: "f",
            mimeType: "m",
            media: data,
            segmentIndex: 1
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .upload)
        XCTAssertEqual(req.path, "/1.1/media/upload.json")
        XCTAssertEqual(req.bodyContentType, .multipartFormData)
        XCTAssertEqual(
            req.parameters,
            [
                "command": MultipartFormDataPart.value(name: "command", value: "APPEND"),
                "media_id": MultipartFormDataPart.value(name: "media_id", value: "m"),
                "media": MultipartFormDataPart.data(name: "media", value: data, filename: "f", mimeType: "m"),
                "segment_index": MultipartFormDataPart.value(name: "segment_index", value: 1),
            ]
        )
    }

    public func testSegments() throws {
        let data = Data([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

        let req = UploadMediaAppendRequestV1(
            mediaID: "m",
            filename: "f",
            mimeType: "m",
            media: data
        )

        let reqs = req.segments(maxBytes: 3)

        XCTAssertEqual(reqs.count, 4)

        XCTAssertEqual(reqs[0].mediaID, "m")
        XCTAssertEqual(reqs[0].filename, "f")
        XCTAssertEqual(reqs[0].mimeType, "m")

        XCTAssertEqual(reqs[0].media, Data([0, 1, 2]))
        XCTAssertEqual(reqs[0].segmentIndex, 0)

        XCTAssertEqual(reqs[1].media, Data([3, 4, 5]))
        XCTAssertEqual(reqs[1].segmentIndex, 1)

        XCTAssertEqual(reqs[2].media, Data([6, 7, 8]))
        XCTAssertEqual(reqs[2].segmentIndex, 2)

        XCTAssertEqual(reqs[3].media, Data([9, 10]))
        XCTAssertEqual(reqs[3].segmentIndex, 3)
    }

    public func testSegumentsMiddle() throws {
        //              | 0  |  1  |  2  |  3  |  4  | 5
        let data = Data([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

        let req = UploadMediaAppendRequestV1(
            mediaID: "m",
            filename: "f",
            mimeType: "m",
            media: data,
            segmentIndex: 2
        )

        let reqs = req.segments(maxBytes: 2)

        XCTAssertEqual(reqs.count, 4)

        XCTAssertEqual(reqs[0].mediaID, "m")
        XCTAssertEqual(reqs[0].filename, "f")
        XCTAssertEqual(reqs[0].mimeType, "m")

        XCTAssertEqual(reqs[0].media, Data([4, 5]))
        XCTAssertEqual(reqs[0].segmentIndex, 2)

        XCTAssertEqual(reqs[1].media, Data([6, 7]))
        XCTAssertEqual(reqs[1].segmentIndex, 3)

        XCTAssertEqual(reqs[2].media, Data([8, 9]))
        XCTAssertEqual(reqs[2].segmentIndex, 4)

        XCTAssertEqual(reqs[3].media, Data([10]))
        XCTAssertEqual(reqs[3].segmentIndex, 5)
    }

    deinit {
        // De-init Logic Here
    }
}
