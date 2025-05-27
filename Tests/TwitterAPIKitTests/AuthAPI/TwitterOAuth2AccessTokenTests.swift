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
    public func test() throws {
        try XCTContext.runActivity(named: "without refresh_token") { _ in

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
        }

        try XCTContext.runActivity(named: "with refresh_token") { _ in

            let data = Data(
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
            guard let token = try TwitterOAuth2AccessToken(jsonData: data) else {
                XCTFail("Failed to create test token")
                return
            }
            XCTAssertEqual(token.scope, ["tweet.write", "tweet.read", "offline.access"])
            XCTAssertEqual(token.tokenType, "bearer")
            XCTAssertEqual(token.expiresIn, 7_200)
            XCTAssertEqual(token.accessToken, "<token>")
            XCTAssertEqual(token.refreshToken, "<refresh token>")
        }
    }

    public func testError() throws {
        try XCTContext.runActivity(named: "Not json") { _ in
            XCTAssertThrowsError(try TwitterOAuth2AccessToken.fromResponse(data: Data("aa".utf8))) { error in
                guard let error = error as? TwitterAPIKitError else {
                    XCTFail("Expected TwitterAPIKitError")
                    return
                }
                XCTAssertTrue(error.isResponseSerializeFailed)
            }
        }

        try XCTContext.runActivity(named: "valid json but invalid object") { _ in
            XCTAssertThrowsError(try TwitterOAuth2AccessToken.fromResponse(data: Data("{}".utf8))) { error in
                guard let error = error as? TwitterAPIKitError else {
                    XCTFail("Expected TwitterAPIKitError")
                    return
                }
                XCTAssertTrue(error.isResponseSerializeFailed)
            }
        }
    }

    deinit {
        // De-init Logic Here
    }
}
