// GetTweetsSearchRecentRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class GetTweetsSearchRecentRequestV2Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = GetTweetsSearchRecentRequestV2(
            query: "Q",
            endTime: Date(timeIntervalSince1970: 100),
            expansions: [.authorID, .attachmentsPollIDs],
            maxResults: 10,
            mediaFields: [.url, .altText],
            nextToken: "next_token",
            placeFields: [.id, .name],
            pollFields: [.endDatetime],
            sinceID: "since_id",
            sortOrder: .recency,
            startTime: Date(timeIntervalSince1970: 1),
            tweetFields: [.id, .text],
            untilID: "untile_id",
            userFields: [.username, .pinnedTweetID]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/2/tweets/search/recent")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "Q",
                "end_time": "1970-01-01T00:01:40Z",
                "expansions": "attachments.poll_ids,author_id",
                "max_results": 10,
                "media.fields": "alt_text,url",
                "next_token": "next_token",
                "place.fields": "id,name",
                "poll.fields": "end_datetime",
                "since_id": "since_id",
                "sort_order": "recency",
                "start_time": "1970-01-01T00:00:01Z",
                "tweet.fields": "id,text",
                "until_id": "untile_id",
                "user.fields": "pinned_tweet_id,username",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
