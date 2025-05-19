// GetUsersFollowedListsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetUsersFollowedListsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersFollowedListsRequestV2(
            id: "_id_",
            expansions: [.ownerID],
            listFields: [.name],
            maxResults: 10,
            paginationToken: "t",
            userFields: [.entities]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/followed_lists")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "owner_id",
                "list.fields": "name",
                "max_results": 10,
                "pagination_token": "t",
                "user.fields": "entities",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersFollowedListsRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
