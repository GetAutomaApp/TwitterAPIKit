// GetTweetsCountsRecentRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsCountsRecentRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsCountsRecentRequestV2(
            query: "q",
            endTime: Date(timeIntervalSince1970: 0),
            granularity: .hour,
            sinceID: "s",
            startTime: Date(timeIntervalSince1970: 120),
            untilID: "u"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/2/tweets/counts/recent")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "q",
                "end_time": "1970-01-01T00:00:00Z",
                "granularity": "hour",
                "since_id": "s",
                "start_time": "1970-01-01T00:02:00Z",
                "until_id": "u",
            ]
        )
    }

}
