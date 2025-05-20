// GetCollectionsEntriesRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetCollectionsEntriesRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetCollectionsEntriesRequestV1(
            id: "_i_",
            count: 12,
            maxPosition: "_m_",
            minPosition: "_m_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/entries.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "count": 12,
                "max_position": "_m_",
                "min_position": "_m_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetCollectionsEntriesRequestV1(
            id: "i"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "i",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
