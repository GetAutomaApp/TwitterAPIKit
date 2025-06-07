// DeleteTweetRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class DeleteTweetRequestV2Tests: XCTestCase {
    public func test() throws {
        let request = DeleteTweetRequestV2(id: "123")
        XCTAssertEqual(request.method, .delete)
        XCTAssertEqual(request.path, "/2/tweets/123")
        XCTAssertEqual(request.bodyContentType, .wwwFormUrlEncoded)
        XCTAssertTrue(request.parameters.isEmpty)
    }

}
