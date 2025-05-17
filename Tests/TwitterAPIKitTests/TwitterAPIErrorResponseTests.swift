// TwitterAPIErrorResponseTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class TwitterAPIErrorResponseTests: XCTestCase {
    public func testTwitterAPIErrorResponseV1() throws {
        XCTContext.runActivity(named: "") { _ in

            let v1Response = TwitterAPIErrorResponseV1(message: "_message_", code: 100, errors: [])
            XCTAssertEqual(v1Response.message, "_message_")
            XCTAssertEqual(v1Response.code, 100)
            XCTAssertEqual(v1Response.errors, [TwitterAPIErrorResponseV1]())
            XCTAssertTrue(v1Response.contains(code: 100))
            XCTAssertFalse(v1Response.contains(code: 1))
        }

        XCTContext.runActivity(named: "from obj") { _ in

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

            guard let v1Response = TwitterAPIErrorResponseV1(obj: obj) else {
                return XCTFail("Failed to parse response")
            }

            XCTAssertEqual(v1Response.message, "message1")
            XCTAssertEqual(v1Response.code, 1)
            XCTAssertEqual(
                v1Response.errors,
                [
                    .init(message: "message1", code: 1, errors: []),
                    .init(message: "message2", code: 2, errors: []),
                ]
            )
            XCTAssertTrue(v1Response.contains(code: 1))
            XCTAssertFalse(v1Response.contains(code: 100))

            XCTAssertEqual(
                v1Response,
                .init(
                    message: "message1",
                    code: 1,
                    errors: [
                        .init(message: "message1", code: 1, errors: []),
                        .init(message: "message2", code: 2, errors: []),
                    ]
                )
            )
        }

        XCTContext.runActivity(named: "Invalid") { _ in
            XCTAssertNil(TwitterAPIErrorResponseV1(obj: [:]))
        }
    }

    public func testTwitterAPIErrorResponseV2() throws {
        XCTContext.runActivity(named: "") { _ in

            let v2Response = TwitterAPIErrorResponseV2(title: "t", detail: "d", type: "ty", errors: [])
            XCTAssertEqual(v2Response.title, "t")
            XCTAssertEqual(v2Response.detail, "d")
            XCTAssertEqual(v2Response.type, "ty")
            XCTAssertEqual(v2Response.errors, [])
        }

        XCTContext.runActivity(named: "from obj") { _ in
            let obj: [String: Any] = [
                "title": "_title_",
                "detail": "_detail_",
                "type": "_type_",
                "errors": [
                    ["message": "_message_", "parameters": ["param": ["b"]]],

                ],
            ]
            guard let v2Response = TwitterAPIErrorResponseV2(obj: obj) else {
                return XCTFail("Failed to parse response")
            }

            XCTAssertEqual(v2Response.title, "_title_")
            XCTAssertEqual(v2Response.detail, "_detail_")
            XCTAssertEqual(v2Response.type, "_type_")
            XCTAssertEqual(v2Response.errors.first?.message, "_message_")
            XCTAssertEqual(v2Response.errors.first?.parameters["param"], ["b"])

            XCTAssertEqual(
                v2Response,
                TwitterAPIErrorResponseV2(
                    title: "_title_",
                    detail: "_detail_",
                    type: "_type_",
                    errors: [.init(message: "_message_", parameters: ["param": ["b"]])]
                )
            )
        }

        XCTContext.runActivity(named: "Invalid") { _ in
            XCTAssertNil(TwitterAPIErrorResponseV2(obj: [:]))
        }
    }

    public func testTwitterAPIErrorResponse() throws {
        try XCTContext.runActivity(named: "V1") { _ in
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

            XCTAssertTrue(error.isV1)
            XCTAssertNotNil(error.v1)

            XCTAssertFalse(error.isV2)
            XCTAssertNil(error.v2)

            XCTAssertFalse(error.isUnknown)
            XCTAssertNil(error.unknownData)

            XCTAssertEqual(error.message, "message1")
            XCTAssertEqual(error.code, 1)
        }

        try XCTContext.runActivity(named: "v2") { _ in
            let obj: [String: Any] = [
                "title": "_title_",
                "detail": "_detail_",
                "type": "_type_",
                "errors": [
                    ["message": "_message_", "parameters": ["param": ["b"]]],

                ],
            ]
            let data = try JSONSerialization.data(withJSONObject: obj, options: [])
            let error = TwitterAPIErrorResponse(data: data)

            XCTAssertFalse(error.isV1)
            XCTAssertNil(error.v1)

            XCTAssertTrue(error.isV2)
            XCTAssertNotNil(error.v2)

            XCTAssertFalse(error.isUnknown)
            XCTAssertNil(error.unknownData)

            XCTAssertEqual(error.message, "_detail_")
            XCTAssertNil(error.code)
        }

        XCTContext.runActivity(named: "unknown") { _ in

            XCTContext.runActivity(named: "empty") { _ in
                let error = TwitterAPIErrorResponse(data: Data())
                XCTAssertEqual(error, .unknown(Data()))
                XCTAssertTrue(error.isUnknown)
                XCTAssertEqual(error.message, "")
                XCTAssertNil(error.code)
            }

            XCTContext.runActivity(named: "invalid") { _ in
                let data = Data("{}")
                let error = TwitterAPIErrorResponse(data: data)
                XCTAssertEqual(error, .unknown(data))
                XCTAssertTrue(error.isUnknown)
                XCTAssertEqual(error.unknownData, data)
                XCTAssertEqual(error.message, "{}")
            }
        }
    }

    deinit {
        // De-init Logic Here
    }
}
