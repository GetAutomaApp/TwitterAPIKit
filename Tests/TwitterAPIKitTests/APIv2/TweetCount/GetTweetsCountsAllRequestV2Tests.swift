// GetTweetsCountsAllRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetTweetsCountsAllRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsCountsAllRequestV2(
            query: "a",
            endTime: Date(timeIntervalSince1970: 10),
            granularity: .minute,
            nextToken: "n",
            sinceID: "s",
            startTime: Date(timeIntervalSince1970: 5),
            untilID: "u"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/2/tweets/counts/all")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "a",
                "end_time": "1970-01-01T00:00:10Z",
                "granularity": "minute",
                "next_token": "n",
                "since_id": "s",
                "start_time": "1970-01-01T00:00:05Z",
                "until_id": "u",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
