// GetListsFollowersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsFollowersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetListsFollowersRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 12,
            paginationToken: "t",
            tweetFields: [.entities],
            userFields: [.verified]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_/followers")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 12,
                "pagination_token": "t",
                "tweet.fields": "entities",
                "user.fields": "verified",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsFollowersRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

}
