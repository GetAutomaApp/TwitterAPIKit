// TwitterOAuth2BearerTokenTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterOAuth2BearerTokenTests: XCTestCase {
    public func testJsonData() throws {
        let data = Data(#"{"token_type":"bearer","access_token":"token"}"#.utf8)
        guard let token = try TwitterOAuth2BearerToken(jsonData: data) else {
            XCTFail("Failed to create test token")
            return
        }

        XCTAssertEqual(token.tokenType, "bearer")
        XCTAssertEqual(token.accessToken, "token")
    }

    public func testNil() throws {
        let data = Data("{}".utf8)
        XCTAssertNil(try TwitterOAuth2BearerToken(jsonData: data))
    }

    public func testThrow() throws {
        let data = Data("".utf8)
        XCTAssertThrowsError(try TwitterOAuth2BearerToken(jsonData: data))
    }

    deinit {
        // De-init Logic Here
    }
}
