// GetSpaceRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSpaceRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpaceRequestV2(
            id: "_i_",
            expansions: [.hostIDs],
            spaceFields: [.title],
            topicFields: [.name],
            userFields: [.username]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces/_i_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "host_ids",
                "space.fields": "title",
                "topic.fields": "name",
                "user.fields": "username",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpaceRequestV2(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

}
