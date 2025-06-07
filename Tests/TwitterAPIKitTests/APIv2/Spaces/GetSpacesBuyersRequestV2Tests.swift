// GetSpacesBuyersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSpacesBuyersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpacesBuyersRequestV2(
            id: "_i_",
            expansions: [.pinnedTweetID],
            mediaFields: [.url],
            placeFields: [.geo],
            pollFields: [.options],
            tweetFields: [.entities],
            userFields: [.protected]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces/_i_/buyers")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "media.fields": "url",
                "place.fields": "geo",
                "poll.fields": "options",
                "tweet.fields": "entities",
                "user.fields": "protected",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpacesBuyersRequestV2(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
