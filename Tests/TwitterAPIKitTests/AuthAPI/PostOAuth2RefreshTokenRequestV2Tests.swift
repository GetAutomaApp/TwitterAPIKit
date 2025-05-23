// PostOAuth2RefreshTokenRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostOAuth2RefreshTokenRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuth2RefreshTokenRequestV2(
            refreshToken: "_r_",
            grantType: "_g_",
            clientID: "_c_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/oauth2/token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "refresh_token": "_r_",
                "grant_type": "_g_",
                "client_id": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostOAuth2RefreshTokenRequestV2(
            refreshToken: "_rt_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "refresh_token": "_rt_",
                "grant_type": "refresh_token",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
