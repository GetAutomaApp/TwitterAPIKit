// GetListsTweetsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListsTweetsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetListsTweetsRequestV2(
            id: "_id_",
            expansions: [.referencedTweetsIDAuthorID],
            maxResults: 10,
            paginationToken: "t",
            tweetFields: [.text],
            userFields: [.profileImageUrl]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_/tweets")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "referenced_tweets.id.author_id",
                "max_results": 10,
                "pagination_token": "t",
                "tweet.fields": "text",
                "user.fields": "profile_image_url",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsTweetsRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
