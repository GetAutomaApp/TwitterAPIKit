// GetUsersMentionsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersMentionsRequestV2Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = GetUsersMentionsRequestV2(
            id: "_i_",
            endTime: Date(timeIntervalSince1970: 11),
            expansions: [.geoPlaceID],
            maxResults: 150,
            mediaFields: [.url],
            paginationToken: "_p_",
            placeFields: [.geo],
            pollFields: [.id],
            sinceID: "_s_",
            startTime: Date(timeIntervalSince1970: 2),
            tweetFields: [.entities],
            untilID: "_u_",
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_i_/mentions")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "end_time": "1970-01-01T00:00:11Z",
                "expansions": "geo.place_id",
                "max_results": 150,
                "media.fields": "url",
                "pagination_token": "_p_",
                "place.fields": "geo",
                "poll.fields": "id",
                "since_id": "_s_",
                "start_time": "1970-01-01T00:00:02Z",
                "tweet.fields": "entities",
                "until_id": "_u_",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersMentionsRequestV2(
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
