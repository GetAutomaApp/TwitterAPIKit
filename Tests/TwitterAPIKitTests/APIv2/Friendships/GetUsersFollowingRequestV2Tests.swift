// GetUsersFollowingRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersFollowingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersFollowingRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 20,
            paginationToken: "t",
            tweetFields: [.text],
            userFields: [.name]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/following")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 20,
                "pagination_token": "t",
                "tweet.fields": "text",
                "user.fields": "name",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersFollowingRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
