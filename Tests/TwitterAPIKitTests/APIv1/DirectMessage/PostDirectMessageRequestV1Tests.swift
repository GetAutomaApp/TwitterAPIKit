// PostDirectMessageRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostDirectMessageRequestV1Tests: XCTestCase {
    public func testText() throws {
        let req = PostDirectMessageRequestV1(
            targetUserID: "target",
            message: "msg"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/new.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "event": [
                    "type": "message_create",
                    "message_create": [
                        "message_data": ["text": "msg"],
                        "target": ["recipient_id": "target"],
                    ],
                ],
            ]
        )
    }

    // swiftlint:disable:next function_body_length
    public func testQuickReplyOptions() throws {
        let req = PostDirectMessageRequestV1(
            targetUserID: "target",
            message: "msg",
            quickReplyOptions: [
                .init(label: "label", description: "label desc", metadata: "meta"),
                .init(label: "label 2", description: "label desc 2", metadata: "meta 2"),
            ]
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/new.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "event": [
                    "type": "message_create",
                    "message_create": [
                        "target": ["recipient_id": "target"],
                        "message_data": [
                            "text": "msg",
                            "quick_reply": [
                                "type": "options",
                                "options": [
                                    ["label": "label", "description": "label desc", "metadata": "meta"],
                                    ["label": "label 2", "description": "label desc 2", "metadata": "meta 2"],
                                ],
                            ],
                        ],
                    ],
                ],
            ]
        )
    }

    public func testAttachMedia() throws {
        let req = PostDirectMessageRequestV1(
            targetUserID: "target",
            message: "msg with media",
            attachment: .media("media_id")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/new.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "event": [
                    "type": "message_create",
                    "message_create": [
                        "message_data": [
                            "text": "msg with media",
                            "attachment": [
                                "type": "media",
                                "media": [
                                    "id": "media_id",
                                ],
                            ],
                        ],
                        "target": ["recipient_id": "target"],
                    ],
                ],
            ]
        )
    }

    // swiftlint:disable:next function_body_length
    public func testAttachLocation() throws {
        let req = PostDirectMessageRequestV1(
            targetUserID: "target",
            message: "msg",
            attachment: .location(.coordinate(.init(lat: 10, long: 20)))
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/new.json")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "event": [
                    "type": "message_create",
                    "message_create": [
                        "message_data": [
                            "text": "msg",
                            "attachment": [
                                "type": "location",
                                "location": [
                                    "type": "shared_coordinate",
                                    "shared_coordinate": [
                                        "coordinates": [
                                            "type": "Point",
                                            "coordinates": [10, 20],
                                        ],
                                    ],
                                ],
                            ],
                        ],
                        "target": ["recipient_id": "target"],
                    ],
                ],
            ]
        )

        let req2 = PostDirectMessageRequestV1(
            targetUserID: "target",
            message: "msg",
            attachment: .location(.place("place_id"))
        )

        XCTAssertEqual(req2.method, .post)
        XCTAssertEqual(req2.path, "/1.1/direct_messages/events/new.json")
        XCTAssertEqual(req2.bodyContentType, .json)
        AssertEqualAnyDict(
            req2.parameters,
            [
                "event": [
                    "type": "message_create",
                    "message_create": [
                        "message_data": [
                            "text": "msg",
                            "attachment": [
                                "type": "location",
                                "location": [
                                    "type": "shared_place",
                                    "shared_place": [
                                        "place": [
                                            "id": "place_id",
                                        ],
                                    ],
                                ],
                            ],
                        ],
                        "target": ["recipient_id": "target"],
                    ],
                ],
            ]
        )
    }

}
