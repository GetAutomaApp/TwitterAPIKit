// GetTweetsRetweetedByRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsRetweetedByRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsRetweetedByRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 11,
            mediaFields: [.height, .nonPublicMetrics],
            paginationToken: "t",
            placeFields: [.id, .placeType, .countryCode],
            pollFields: [.options, .endDatetime],
            tweetFields: [.nonPublicMetrics, .contextAnnotations],
            userFields: [.username, .withheld]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/tweets/_id_/retweeted_by")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 11,
                "media.fields": "height,non_public_metrics",
                "pagination_token": "t",
                "place.fields": "country_code,id,place_type",
                "poll.fields": "end_datetime,options",
                "tweet.fields": "context_annotations,non_public_metrics",
                "user.fields": "username,withheld",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTweetsRetweetedByRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
