// GetUsersBlockingRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersBlockingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersBlockingRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            maxResults: 100,
            paginationToken: "token",
            tweetFields: [.entities, .geo, .contextAnnotations],
            userFields: [.profileImageUrl, .protected, .publicMetrics]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/blocking")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.queryParameters,
            [
                "expansions": "pinned_tweet_id",
                "max_results": 100,
                "pagination_token": "token",
                "tweet.fields": "context_annotations,entities,geo",
                "user.fields": "profile_image_url,protected,public_metrics",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersBlockingRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
