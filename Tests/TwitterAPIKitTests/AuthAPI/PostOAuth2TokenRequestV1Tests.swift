// PostOAuth2TokenRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostOAuth2TokenRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuth2TokenRequestV1(
            grantType: "_g_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth2/token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "grant_type": "_g_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostOAuth2TokenRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [
                "grant_type": "client_credentials",
            ]
        )
    }

}
