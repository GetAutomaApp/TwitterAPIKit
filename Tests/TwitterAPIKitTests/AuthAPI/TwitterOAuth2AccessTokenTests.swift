// TwitterOAuth2AccessTokenTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal class TwitterOAuth2AccessTokenTests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let data = Data(
            #"""
            {
            "scope" : "tweet.write tweet.read",
            "token_type" : "bearer",
            "expires_in" : 7200,
            "access_token" : "<token>"
            }
            """#.utf8
        )
        guard let token = try TwitterOAuth2AccessToken(jsonData: data) else {
            XCTFail("Failed to create test token")
            return
        }
        XCTAssertEqual(token.scope, ["tweet.write", "tweet.read"])
        XCTAssertEqual(token.tokenType, "bearer")
        XCTAssertEqual(token.expiresIn, 7_200)
        XCTAssertEqual(token.accessToken, "<token>")
        XCTAssertNil(token.refreshToken)

        let data2 = Data(
            #"""
            {
            "scope" : "tweet.write tweet.read offline.access",
            "token_type" : "bearer",
            "expires_in" : 7200,
            "access_token" : "<token>",
            "refresh_token" : "<refresh token>"
            }
            """#.utf8
        )
        guard let token2 = try TwitterOAuth2AccessToken(jsonData: data2) else {
            XCTFail("Failed to create test token")
            return
        }
        XCTAssertEqual(token2.scope, ["tweet.write", "tweet.read", "offline.access"])
        XCTAssertEqual(token2.tokenType, "bearer")
        XCTAssertEqual(token2.expiresIn, 7_200)
        XCTAssertEqual(token2.accessToken, "<token>")
        XCTAssertEqual(token2.refreshToken, "<refresh token>")
    }

    public func testError() throws {
        XCTAssertThrowsError(try TwitterOAuth2AccessToken.fromResponse(data: Data("aa".utf8))) { error in
            guard let error = error as? TwitterAPIKitError else {
                XCTFail("Expected TwitterAPIKitError")
                return
            }
            XCTAssertTrue(error.isResponseSerializeFailed)
        }

        XCTAssertThrowsError(try TwitterOAuth2AccessToken.fromResponse(data: Data("{}".utf8))) { error in
            guard let error = error as? TwitterAPIKitError else {
                XCTFail("Expected TwitterAPIKitError")
                return
            }
            XCTAssertTrue(error.isResponseSerializeFailed)
        }
    }

    deinit {
        // De-init Logic Here
    }
}
