// GetTweetsSearchStreamRulesRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetTweetsSearchStreamRulesRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetTweetsSearchStreamRulesRequestV2(
            ids: ["10", "20"]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/tweets/search/stream/rules")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "ids": "10,20",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetTweetsSearchStreamRulesRequestV2()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
