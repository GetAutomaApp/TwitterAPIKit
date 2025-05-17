// GetUserRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetUserRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUserRequestV2(
            id: "_id_",
            expansions: [.pinnedTweetID],
            tweetFields: [.entities],
            userFields: [.protected]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "tweet.fields": "entities",
                "user.fields": "protected",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUserRequestV2(
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
