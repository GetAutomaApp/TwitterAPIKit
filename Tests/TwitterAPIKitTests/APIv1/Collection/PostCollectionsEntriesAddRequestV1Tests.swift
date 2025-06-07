// PostCollectionsEntriesAddRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostCollectionsEntriesAddRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostCollectionsEntriesAddRequestV1(
            id: "_i_",
            tweetID: "_t_",
            above: true,
            relativeTo: "_r_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/entries/add.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "tweet_id": "_t_",
                "above": true,
                "relative_to": "_r_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostCollectionsEntriesAddRequestV1(
            id: "_i_",
            tweetID: "_t_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "tweet_id": "_t_",
            ]
        )
    }

}
