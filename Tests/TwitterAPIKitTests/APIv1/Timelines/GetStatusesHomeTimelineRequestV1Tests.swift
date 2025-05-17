// GetStatusesHomeTimelineRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetStatusesHomeTimelineRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetStatusesHomeTimelineRequestV1(
            count: 11,
            maxID: "_m_",
            sinceID: "_s_",
            trimUser: true,
            excludeReplies: true,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/home_timeline.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "count": 11,
                "max_id": "_m_",
                "since_id": "_s_",
                "trim_user": true,
                "exclude_replies": true,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetStatusesHomeTimelineRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
