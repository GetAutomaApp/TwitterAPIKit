// GetAccountVerifyCredentialsRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetAccountVerifyCredentialsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetAccountVerifyCredentialsRequestV1(
            skipStatus: true,
            includeEmail: true,
            includeEntities: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/account/verify_credentials.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "skip_status": true,
                "include_email": true,
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetAccountVerifyCredentialsRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
