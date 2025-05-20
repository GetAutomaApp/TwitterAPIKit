// GetSpacesTweetsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetSpacesTweetsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetSpacesTweetsRequestV2(
            id: "_i_",
            expansions: [.entitiesMentionsUsername],
            mediaFields: [.url],
            placeFields: [.placeType],
            pollFields: [.votingStatus],
            tweetFields: [.contextAnnotations],
            userFields: [.publicMetrics]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/spaces/_i_/tweets")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "entities.mentions.username",
                "media.fields": "url",
                "place.fields": "place_type",
                "poll.fields": "voting_status",
                "tweet.fields": "context_annotations",
                "user.fields": "public_metrics",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetSpacesTweetsRequestV2(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
