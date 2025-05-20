// GetOAuth2AuthorizeRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetOAuth2AuthorizeRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetOAuth2AuthorizeRequestV1(
            responseType: "_r_",
            clientID: "_c_id_",
            redirectURI: "_r_uri_",
            state: "_s_",
            codeChallenge: "_c_",
            codeChallengeMethod: "_cm_",
            scopes: ["a", "b"]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .twitter)
        XCTAssertEqual(req.path, "/i/oauth2/authorize")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "response_type": "_r_",
                "client_id": "_c_id_",
                "redirect_uri": "_r_uri_",
                "state": "_s_",
                "code_challenge": "_c_",
                "code_challenge_method": "_cm_",
                "scope": "a b",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetOAuth2AuthorizeRequestV1(
            clientID: "_ci_",
            redirectURI: "_r_",
            state: "_s_",
            codeChallenge: "_c_",
            codeChallengeMethod: "_cm_",
            scopes: ["a"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "response_type": "code",
                "client_id": "_ci_",
                "redirect_uri": "_r_",
                "state": "_s_",
                "code_challenge": "_c_",
                "code_challenge_method": "_cm_",
                "scope": "a",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
