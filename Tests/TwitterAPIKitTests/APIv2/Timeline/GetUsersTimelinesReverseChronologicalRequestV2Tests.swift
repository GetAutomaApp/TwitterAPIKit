// GetUsersTimelinesReverseChronologicalRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

// swiftlint:disable:next type_name
internal class GetUsersTimelinesReverseChronologicalRequestV2Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = GetUsersTimelinesReverseChronologicalRequestV2(
            id: "_i_",
            endTime: Date(timeIntervalSince1970: 50),
            exclude: [.retweets],
            expansions: [.authorID],
            maxResults: 10,
            mediaFields: [.altText],
            paginationToken: "_p_",
            placeFields: [.country],
            pollFields: [.options],
            sinceID: "_s_",
            startTime: Date(timeIntervalSince1970: 10),
            tweetFields: [.geo],
            untilID: "_u_",
            userFields: [.location]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_i_/timelines/reverse_chronological")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "end_time": "1970-01-01T00:00:50Z",
                "exclude": "retweets",
                "expansions": "author_id",
                "max_results": 10,
                "media.fields": "alt_text",
                "pagination_token": "_p_",
                "place.fields": "country",
                "poll.fields": "options",
                "since_id": "_s_",
                "start_time": "1970-01-01T00:00:10Z",
                "tweet.fields": "geo",
                "until_id": "_u_",
                "user.fields": "location",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersTimelinesReverseChronologicalRequestV2(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
