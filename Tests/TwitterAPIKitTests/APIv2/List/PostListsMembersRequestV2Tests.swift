// PostListsMembersRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostListsMembersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostListsMembersRequestV2(
            id: "_id_",
            userID: "_userID_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_/members")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "_userID_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
