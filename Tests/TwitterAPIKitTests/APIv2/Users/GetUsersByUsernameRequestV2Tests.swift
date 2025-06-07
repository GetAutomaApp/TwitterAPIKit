// GetUsersByUsernameRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersByUsernameRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersByUsernameRequestV2(
            username: "_username_",
            expansions: [.pinnedTweetID],
            tweetFields: [.withheld],
            userFields: [.profileImageUrl]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/by/username/_username_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "tweet.fields": "withheld",
                "user.fields": "profile_image_url",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersByUsernameRequestV2(
            username: "_username_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
