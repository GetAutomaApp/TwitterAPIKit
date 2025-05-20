// PostOAuthAccessTokenRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostOAuthAccessTokenRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuthAccessTokenRequestV1(
            oauthToken: "_ot_",
            oauthVerifier: "_ov_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth/access_token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_ot_",
                "oauth_verifier": "_ov_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
