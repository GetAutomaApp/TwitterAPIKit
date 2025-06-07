// DeleteUsersFollowedListsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class DeleteUsersFollowedListsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersFollowedListsRequestV2(
            id: "_id_",
            listID: "_listID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/followed_lists/_listID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

}
