// PostCollectionsEntriesCurateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostCollectionsEntriesCurateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsEntriesCurateRequestV1(
            id: "_i_",
            changes: [
                .add(tweetID: "add_id"),
                .remove(tweetID: "remove_id"),
            ]
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/entries/curate.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "changes": [
                    ["op": "add", "tweet_id": "add_id"],
                    ["op": "remove", "tweet_id": "remove_id"],
                ],
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
