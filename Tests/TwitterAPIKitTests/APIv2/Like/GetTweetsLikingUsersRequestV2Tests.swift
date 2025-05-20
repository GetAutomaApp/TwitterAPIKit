// GetTweetsLikingUsersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsLikingUsersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsLikingUsersRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 11,
            mediaFields: [.url, .height],
            paginationToken: "p",
            placeFields: [.name],
            pollFields: [.votingStatus],
            tweetFields: [.entities],
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/tweets/_id_/liking_users")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 11,
                "media.fields": "height,url",
                "pagination_token": "p",
                "place.fields": "name",
                "poll.fields": "voting_status",
                "tweet.fields": "entities",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTweetsLikingUsersRequestV2(
            id: "_id_"
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
