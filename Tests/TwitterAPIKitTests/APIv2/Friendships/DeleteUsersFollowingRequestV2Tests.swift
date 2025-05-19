// DeleteUsersFollowingRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class DeleteUsersFollowingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersFollowingRequestV2(
            sourceUserID: "_sourceUserID_",
            targetUserID: "_targetUserID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_sourceUserID_/following/_targetUserID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
