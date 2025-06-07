// GetFriendshipsShowRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetFriendshipsShowRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFriendshipsShowRequestV1(
            sourceUser: .userID("suid"),
            targetUser: .userID("tuid")
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/friendships/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "source_id": "suid",
                "target_id": "tuid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = GetFriendshipsShowRequestV1(
            sourceUser: .screenName("s"),
            targetUser: .screenName("t")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "source_screen_name": "s",
                "target_screen_name": "t",
            ]
        )
    }

}
