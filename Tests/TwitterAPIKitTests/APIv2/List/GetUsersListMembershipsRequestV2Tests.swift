// GetUsersListMembershipsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersListMembershipsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersListMembershipsRequestV2(
            id: "_id_",
            expansions: [.ownerID],
            listFields: [.followerCount],
            maxResults: 10,
            paginationToken: "t",
            userFields: [.protected]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/list_memberships")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "owner_id",
                "list.fields": "follower_count",
                "max_results": 10,
                "pagination_token": "t",
                "user.fields": "protected",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersListMembershipsRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

}
