// GetTweetsRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsRequestV2Tests: XCTestCase {
    public func test() throws {
        let tweet = GetTweetsRequestV2(ids: ["123", "abc"])

        XCTAssertEqual(tweet.method, .get)
        XCTAssertEqual(tweet.path, "/2/tweets")
        AssertEqualAnyDict(tweet.parameters, ["ids": "123,abc"])

        let tweet2 = GetTweetsRequestV2(
            ids: ["1234"],
            expansions: [.attachmentsMediaKeys],
            mediaFields: [.url, .altText],
            placeFields: [.name, .id],
            pollFields: [.id],
            tweetFields: [.text, .id],
            userFields: [.entities]
        )

        AssertEqualAnyDict(
            tweet2.parameters,
            [
                "ids": "1234",
                "expansions": "attachments.media_keys",
                "media.fields": "alt_text,url",
                "place.fields": "id,name",
                "poll.fields": "id",
                "tweet.fields": "id,text",
                "user.fields": "entities",
            ]
        )
    }

    deinit {
        // De-init Logic Her
    }
}
