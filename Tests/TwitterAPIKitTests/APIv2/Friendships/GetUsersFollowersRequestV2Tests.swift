// GetUsersFollowersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersFollowersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersFollowersRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 10,
            paginationToken: "token",
            tweetFields: [.conversationID],
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/followers")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 10,
                "pagination_token": "token",
                "tweet.fields": "conversation_id",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersFollowersRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

}
