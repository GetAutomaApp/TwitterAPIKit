// TwitterOAuthTokenV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterOAuthTokenV1Tests: XCTestCase {
    public func test() throws {
        let token = TwitterOAuthTokenV1(oauthToken: "token", oauthTokenSecret: "secret", oauthCallbackConfirmed: true)
        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertTrue(token.oauthCallbackConfirmed ?? false)
    }

    public func testQueryStringData() {
        let data = Data("oauth_token=token&oauth_token_secret=secret&oauth_callback_confirmed=true".utf8)
        guard let token = TwitterOAuthTokenV1(queryStringData: data) else {
            XCTFail("Failed to create test token")
            return
        }

        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertTrue(token.oauthCallbackConfirmed ?? false)
    }

    public func testNil() {
        let data = Data("".utf8)
        XCTAssertNil(TwitterOAuthTokenV1(queryStringData: data))
    }

}
