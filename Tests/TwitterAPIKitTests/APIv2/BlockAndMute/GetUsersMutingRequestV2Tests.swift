// GetUsersMutingRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersMutingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersMutingRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 200,
            paginationToken: "t",
            tweetFields: [.id, .inReplyToUserID, .conversationID],
            userFields: [.createdAt, .username, .verified]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/muting")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 200,
                "pagination_token": "t",
                "tweet.fields": "conversation_id,id,in_reply_to_user_id",
                "user.fields": "created_at,username,verified",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersMutingRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
