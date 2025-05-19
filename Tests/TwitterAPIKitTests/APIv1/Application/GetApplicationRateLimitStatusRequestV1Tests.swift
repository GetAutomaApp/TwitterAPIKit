// GetApplicationRateLimitStatusRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetApplicationRateLimitStatusRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetApplicationRateLimitStatusRequestV1(
            resources: ["a", "b"]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/application/rate_limit_status.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "resources": "a,b",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetApplicationRateLimitStatusRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
