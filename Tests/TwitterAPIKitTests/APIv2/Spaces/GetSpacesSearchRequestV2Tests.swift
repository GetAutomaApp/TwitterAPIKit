// GetSpacesSearchRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSpacesSearchRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpacesSearchRequestV2(
            query: "_q_",
            expansions: [.creatorID],
            spaceFields: [.invitedUserIDs],
            state: .scheduled,
            topicFields: [.name],
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces/search")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "_q_",
                "expansions": "creator_id",
                "space.fields": "invited_user_ids",
                "state": "scheduled",
                "topic.fields": "name",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpacesSearchRequestV2(
            query: "あ"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "あ",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
