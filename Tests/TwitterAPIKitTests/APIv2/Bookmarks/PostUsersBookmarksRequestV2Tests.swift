// PostUsersBookmarksRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostUsersBookmarksRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostUsersBookmarksRequestV2(
            id: "_i_",
            tweetID: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_i_/bookmarks")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "tweet_id": "_t_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
