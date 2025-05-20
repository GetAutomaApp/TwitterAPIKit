// PostUsersReportSpamRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostUsersReportSpamRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostUsersReportSpamRequestV1(
            user: .userID("uid"),
            performBlock: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/users/report_spam.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "perform_block": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostUsersReportSpamRequestV1(
            user: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
