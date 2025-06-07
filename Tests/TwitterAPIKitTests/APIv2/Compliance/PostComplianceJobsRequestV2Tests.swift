// PostComplianceJobsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostComplianceJobsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostComplianceJobsRequestV2(
            type: .tweets,
            name: "n",
            resumable: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/compliance/jobs")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "type": "tweets",
                "name": "n",
                "resumable": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostComplianceJobsRequestV2(
            type: .users
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "type": "users",
            ]
        )
    }

}
