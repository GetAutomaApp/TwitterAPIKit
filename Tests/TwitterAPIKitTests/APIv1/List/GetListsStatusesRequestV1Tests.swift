// GetListsStatusesRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetListsStatusesRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsStatusesRequestV1(
            list: .listID("lid"),
            count: 15,
            sinceID: "_s_",
            maxID: "_m_",
            includeEntities: true,
            includeRTs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/statuses.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
                "count": 15,
                "since_id": "_s_",
                "max_id": "_m_",
                "include_entities": true,
                "include_rts": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetListsStatusesRequestV1(
            list: .listID("lid")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
