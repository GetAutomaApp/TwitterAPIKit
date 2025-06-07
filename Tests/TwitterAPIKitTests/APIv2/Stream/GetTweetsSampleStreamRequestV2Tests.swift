// GetTweetsSampleStreamRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsSampleStreamRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsSampleStreamRequestV2(
            backfillMinutes: 2,
            expansions: [.entitiesMentionsUsername],
            mediaFields: [.durationMs],
            placeFields: [.countryCode],
            pollFields: [.options],
            tweetFields: [.entities],
            userFields: [.pinnedTweetID]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/tweets/sample/stream")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "backfill_minutes": 2,
                "expansions": "entities.mentions.username",
                "media.fields": "duration_ms",
                "place.fields": "country_code",
                "poll.fields": "options",
                "tweet.fields": "entities",
                "user.fields": "pinned_tweet_id",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTweetsSampleStreamRequestV2()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
