// GetTweetRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetRequestV2Tests: XCTestCase {
    public func test() throws {
        let tweet = GetTweetRequestV2(id: "123")

        XCTAssertEqual(tweet.method, .get)
        XCTAssertEqual(tweet.path, "/2/tweets/123")
        AssertEqualAnyDict(tweet.parameters, [:])

        let tweet2 = GetTweetRequestV2(
            id: "1234",
            expansions: [.authorID],
            mediaFields: [.url, .altText],
            placeFields: [.name, .id],
            pollFields: [.id],
            tweetFields: [.text, .id],
            userFields: [.entities]
        )

        AssertEqualAnyDict(
            tweet2.parameters,
            [
                "expansions": "author_id",
                "media.fields": "alt_text,url",
                "place.fields": "id,name",
                "poll.fields": "id",
                "tweet.fields": "id,text",
                "user.fields": "entities",
            ]
        )
    }

}
