// GetListRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetListRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetListRequestV2(
            id: "_id_",
            expansions: [.ownerID],
            listFields: [.ownerID, .description],
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "owner_id",
                "list.fields": "description,owner_id",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListRequestV2(
            id: "_id_"
        )

        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
