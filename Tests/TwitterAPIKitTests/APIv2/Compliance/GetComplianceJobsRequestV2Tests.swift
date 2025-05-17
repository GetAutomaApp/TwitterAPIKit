// GetComplianceJobsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetComplianceJobsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetComplianceJobsRequestV2(
            type: .tweets,
            status: .complete
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/compliance/jobs")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "type": "tweets",
                "status": "complete",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetComplianceJobsRequestV2(
            type: .users
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "type": "users",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
