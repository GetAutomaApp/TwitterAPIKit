// GetTweetsSearchStreamRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetTweetsSearchStreamRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsSearchStreamRequestV2(
            backfillMinutes: 1,
            expansions: [.referencedTweetsIDAuthorID],
            mediaFields: [.height],
            placeFields: [.name],
            pollFields: [.endDatetime],
            tweetFields: [.geo],
            userFields: [.withheld]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/tweets/search/stream")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "backfill_minutes": 1,
                "expansions": "referenced_tweets.id.author_id",
                "media.fields": "height",
                "place.fields": "name",
                "poll.fields": "end_datetime",
                "tweet.fields": "geo",
                "user.fields": "withheld",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTweetsSearchStreamRequestV2()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
