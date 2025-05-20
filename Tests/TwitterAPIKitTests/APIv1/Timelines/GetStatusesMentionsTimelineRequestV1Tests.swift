// GetStatusesMentionsTimelineRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetStatusesMentionsTimelineRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetStatusesMentionsTimelineRequestV1(
            count: 100,
            maxID: "_m_",
            sinceID: "_s_",
            trimUser: true,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/mentions_timeline.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "count": 100,
                "max_id": "_m_",
                "since_id": "_s_",
                "trim_user": true,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetStatusesMentionsTimelineRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
