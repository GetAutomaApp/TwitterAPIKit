// PostOAuth2AccessTokenRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostOAuth2AccessTokenRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuth2AccessTokenRequestV2(
            code: "_c_",
            grantType: "_g_",
            clientID: "_cid_",
            redirectURI: "_r_",
            codeVerifier: "_cv_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/oauth2/token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "code": "_c_",
                "grant_type": "_g_",
                "client_id": "_cid_",
                "redirect_uri": "_r_",
                "code_verifier": "_cv_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostOAuth2AccessTokenRequestV2(
            code: "_c_",
            redirectURI: "_r_",
            codeVerifier: "_cv_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "code": "_c_",
                "grant_type": "authorization_code",
                "redirect_uri": "_r_",
                "code_verifier": "_cv_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
