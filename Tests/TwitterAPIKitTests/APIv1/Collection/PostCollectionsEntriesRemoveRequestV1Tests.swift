// PostCollectionsEntriesRemoveRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostCollectionsEntriesRemoveRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsEntriesRemoveRequestV1(
            id: "_i_",
            tweetID: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/entries/remove.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "tweet_id": "_t_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
