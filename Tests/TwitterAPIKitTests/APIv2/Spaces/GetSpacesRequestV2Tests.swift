// GetSpacesRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class GetSpacesRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpacesRequestV2(
            ids: ["a", "b"],
            expansions: [.speakerIDs],
            spaceFields: [.lang],
            topicFields: [.description],
            userFields: [.withheld]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "ids": "a,b",
                "expansions": "speaker_ids",
                "space.fields": "lang",
                "topic.fields": "description",
                "user.fields": "withheld",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpacesRequestV2(
            ids: ["a", "b", "あ"]
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "ids": "a,b,あ",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
