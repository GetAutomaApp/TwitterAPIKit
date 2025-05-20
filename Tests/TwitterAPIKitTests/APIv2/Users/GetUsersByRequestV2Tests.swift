// GetUsersByRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersByRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersByRequestV2(
            usernames: ["a", "b"],
            expansions: [.pinnedTweetID],
            tweetFields: [.geo],
            userFields: [.url]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/by")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "usernames": "a,b",
                "expansions": "pinned_tweet_id",
                "tweet.fields": "geo",
                "user.fields": "url",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersByRequestV2(
            usernames: ["a", "b"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "usernames": "a,b",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
