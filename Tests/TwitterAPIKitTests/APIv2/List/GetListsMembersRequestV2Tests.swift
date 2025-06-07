// GetListsMembersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsMembersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetListsMembersRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 100,
            paginationToken: "t",
            tweetFields: [.createdAt],
            userFields: [.protected]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_/members")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 100,
                "pagination_token": "t",
                "tweet.fields": "created_at",
                "user.fields": "protected",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsMembersRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

}
