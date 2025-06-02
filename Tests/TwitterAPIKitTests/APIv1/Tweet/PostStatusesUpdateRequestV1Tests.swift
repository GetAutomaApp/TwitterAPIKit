// PostStatusesUpdateRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostStatusesUpdateRequestV1Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let req = PostStatusesUpdateRequestV1(
            status: "_s_",
            inReplyToStatusID: "_i_",
            autoPopulateReplyMetadata: true,
            excludeReplyUserIDs: ["786491", "54931584"],
            attachmentUrl: "_a_",
            mediaIDs: ["1", "2"],
            possiblySensitive: true,
            location: .init(lat: 10.1, long: -1.2),
            placeID: "_p_",
            displayCoordinates: true,
            trimUser: true,
            enableDMcommands: true,
            failDMcommands: true,
            cardUri: "_c_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/update.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "status": "_s_",
                "in_reply_to_status_id": "_i_",
                "auto_populate_reply_metadata": true,
                "exclude_reply_user_ids": "786491,54931584",
                "attachment_url": "_a_",
                "media_ids": "1,2",
                "possibly_sensitive": true,
                "lat": 10.1,
                "long": -1.2,
                "place_id": "_p_",
                "display_coordinates": true,
                "trim_user": true,
                "enable_dmcommands": true,
                "fail_dmcommands": true,
                "card_uri": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostStatusesUpdateRequestV1(
            status: "_s_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "status": "_s_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
