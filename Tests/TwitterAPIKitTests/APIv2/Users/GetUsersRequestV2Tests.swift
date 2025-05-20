// GetUsersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersRequestV2(
            ids: ["a", "b"],
            expansions: [.pinnedTweetID],
            tweetFields: [.createdAt],
            userFields: [.publicMetrics]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "ids": "a,b",
                "expansions": "pinned_tweet_id",
                "tweet.fields": "created_at",
                "user.fields": "public_metrics",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersRequestV2(
            ids: ["a", "b"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "ids": "a,b",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
