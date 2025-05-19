// GetOAuthAuthenticateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetOAuthAuthenticateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetOAuthAuthenticateRequestV1(
            oauthToken: "_o_",
            forceLogin: true,
            screenName: "_s_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth/authenticate")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_o_",
                "force_login": true,
                "screen_name": "_s_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetOAuthAuthenticateRequestV1(
            oauthToken: "_o_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_o_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
