// PostUsersFollowingRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostUsersFollowingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostUsersFollowingRequestV2(
            id: "_id_",
            targetUserID: "_targetUserID_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/following")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(req.parameters, ["target_user_id": "_targetUserID_"])
    }

    deinit {
        // De-init Logic Here
    }
}
