// PutTweetsHiddenRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PutTweetsHiddenRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PutTweetsHiddenRequestV2(id: "12", hidden: true)
        XCTAssertEqual(req.method, .put)
        XCTAssertEqual(req.path, "/2/tweets/12/hidden")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(req.parameters, ["hidden": true])
    }

    deinit {
        // De-init Logic Here
    }
}
