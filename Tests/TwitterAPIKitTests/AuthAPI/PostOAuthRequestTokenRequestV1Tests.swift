// PostOAuthRequestTokenRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostOAuthRequestTokenRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuthRequestTokenRequestV1(
            oauthCallback: "_o_",
            xAuthAccessType: "_x_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth/request_token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_callback": "_o_",
                "x_auth_access_type": "_x_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostOAuthRequestTokenRequestV1(
            oauthCallback: "_o_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_callback": "_o_",
            ]
        )
    }

}
