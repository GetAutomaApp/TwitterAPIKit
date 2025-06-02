// TwitterAPIErrorResponseTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterAPIErrorResponseTests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func testTwitterAPIErrorResponseV1() throws {
        let v1Response = TwitterAPIErrorResponseV1(message: "_message_", code: 100, errors: [])
        XCTAssertEqual(v1Response.message, "_message_")
        XCTAssertEqual(v1Response.code, 100)
        XCTAssertEqual(v1Response.errors, [TwitterAPIErrorResponseV1]())
        XCTAssertTrue(v1Response.contains(code: 100))
        XCTAssertFalse(v1Response.contains(code: 1))

        let obj: [String: Any] = [
            "errors": [
                [
                    "message": "message1",
                    "code": 1,
                ],
                [
                    "message": "message2",
                    "code": 2,
                ],
            ],
        ]

        guard let v1Response2 = TwitterAPIErrorResponseV1(obj: obj) else {
            XCTFail("Failed to parse response")
            return
        }

        XCTAssertEqual(v1Response2.message, "message1")
        XCTAssertEqual(v1Response2.code, 1)
        XCTAssertEqual(
            v1Response2.errors,
            [
                .init(message: "message1", code: 1, errors: []),
                .init(message: "message2", code: 2, errors: []),
            ]
        )
        XCTAssertTrue(v1Response2.contains(code: 1))
        XCTAssertFalse(v1Response2.contains(code: 100))

        XCTAssertEqual(
            v1Response2,
            .init(
                message: "message1",
                code: 1,
                errors: [
                    .init(message: "message1", code: 1, errors: []),
                    .init(message: "message2", code: 2, errors: []),
                ]
            )
        )

        XCTAssertNil(TwitterAPIErrorResponseV1(obj: [:]))
    }

    // swiftlint:disable:next function_body_length
    public func testTwitterAPIErrorResponseV2() throws {
        let v2Response = TwitterAPIErrorResponseV2(title: "t", detail: "d", type: "ty", errors: [])
        XCTAssertEqual(v2Response.title, "t")
        XCTAssertEqual(v2Response.detail, "d")
        XCTAssertEqual(v2Response.type, "ty")
        XCTAssertEqual(v2Response.errors, [])

        let obj: [String: Any] = [
            "title": "_title_",
            "detail": "_detail_",
            "type": "_type_",
            "errors": [
                ["message": "_message_", "parameters": ["param": ["b"]]],
            ],
        ]
        guard let v2Response2 = TwitterAPIErrorResponseV2(obj: obj) else {
            XCTFail("Failed to parse response")
            return
        }

        XCTAssertEqual(v2Response2.title, "_title_")
        XCTAssertEqual(v2Response2.detail, "_detail_")
        XCTAssertEqual(v2Response2.type, "_type_")
        XCTAssertEqual(v2Response2.errors.first?.message, "_message_")
        XCTAssertEqual(v2Response2.errors.first?.parameters["param"], ["b"])

        XCTAssertEqual(
            v2Response2,
            TwitterAPIErrorResponseV2(
                title: "_title_",
                detail: "_detail_",
                type: "_type_",
                errors: [.init(message: "_message_", parameters: ["param": ["b"]])]
            )
        )

        XCTAssertNil(TwitterAPIErrorResponseV2(obj: [:]))
    }

    // swiftlint:disable:next function_body_length
    public func testTwitterAPIErrorResponse() throws {
        let obj: [String: Any] = [
            "errors": [
                [
                    "message": "message1",
                    "code": 1,
                ],
                [
                    "message": "message2",
                    "code": 2,
                ],
            ],
        ]

        let data = try JSONSerialization.data(withJSONObject: obj, options: [])
        let error = TwitterAPIErrorResponse(data: data)

        XCTAssertTrue(error.isVersion1)
        XCTAssertNotNil(error.version1)

        XCTAssertFalse(error.isVersion2)
        XCTAssertNil(error.version2)

        XCTAssertFalse(error.isUnknown)
        XCTAssertNil(error.unknownData)

        XCTAssertEqual(error.message, "message1")
        XCTAssertEqual(error.code, 1)

        let obj2: [String: Any] = [
            "title": "_title_",
            "detail": "_detail_",
            "type": "_type_",
            "errors": [
                ["message": "_message_", "parameters": ["param": ["b"]]],
            ],
        ]
        let data2 = try JSONSerialization.data(withJSONObject: obj2, options: [])
        let error2 = TwitterAPIErrorResponse(data: data2)

        XCTAssertFalse(error2.isVersion1)
        XCTAssertNil(error2.version1)

        XCTAssertTrue(error2.isVersion2)
        XCTAssertNotNil(error2.version2)

        XCTAssertFalse(error2.isUnknown)
        XCTAssertNil(error2.unknownData)

        XCTAssertEqual(error2.message, "_detail_")
        XCTAssertNil(error2.code)

        let error3 = TwitterAPIErrorResponse(data: Data())
        XCTAssertEqual(error3, .unknown(Data()))
        XCTAssertTrue(error3.isUnknown)
        XCTAssertEqual(error3.message, "")
        XCTAssertNil(error3.code)

        let data4 = Data("{}".utf8)
        let error4 = TwitterAPIErrorResponse(data: data4)
        XCTAssertEqual(error4, .unknown(data4))
        XCTAssertTrue(error4.isUnknown)
        XCTAssertEqual(error4.unknownData, data4)
        XCTAssertEqual(error4.message, "{}")
    }

    deinit {
        // De-init Logic Here
    }
}
