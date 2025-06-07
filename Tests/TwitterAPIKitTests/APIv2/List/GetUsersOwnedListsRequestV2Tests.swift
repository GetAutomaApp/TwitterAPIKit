// GetUsersOwnedListsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetUsersOwnedListsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersOwnedListsRequestV2(
            id: "_id_",
            expansions: [.ownerID],
            listFields: [.memberCount],
            maxResults: 11,
            paginationToken: "t",
            userFields: [.createdAt]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/owned_lists")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "owner_id",
                "list.fields": "member_count",
                "max_results": 11,
                "pagination_token": "t",
                "user.fields": "created_at",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersOwnedListsRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

}
