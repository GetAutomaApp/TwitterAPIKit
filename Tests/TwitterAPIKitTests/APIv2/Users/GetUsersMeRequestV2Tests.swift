// GetUsersMeRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersMeRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersMeRequestV2(
            expansions: [.pinnedTweetID],
            tweetFields: [.geo],
            userFields: [.id]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/me")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "tweet.fields": "geo",
                "user.fields": "id",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersMeRequestV2()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
