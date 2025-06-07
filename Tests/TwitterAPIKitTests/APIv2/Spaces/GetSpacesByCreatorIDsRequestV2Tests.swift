// GetSpacesByCreatorIDsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSpacesByCreatorIDsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpacesByCreatorIDsRequestV2(
            userIDs: ["a", "b"],
            expansions: [.invitedUserIDs],
            spaceFields: [.isTicketed],
            topicFields: [.name],
            userFields: [.verified]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces/by/creator_ids")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_ids": "a,b",
                "expansions": "invited_user_ids",
                "space.fields": "is_ticketed",
                "topic.fields": "name",
                "user.fields": "verified",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpacesByCreatorIDsRequestV2(
            userIDs: ["a", "b", "c"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "user_ids": "a,b,c",
            ]
        )
    }

}
