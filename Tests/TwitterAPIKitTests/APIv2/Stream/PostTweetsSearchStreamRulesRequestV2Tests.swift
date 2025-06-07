// PostTweetsSearchStreamRulesRequestV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostTweetsSearchStreamRulesRequestV2Tests: XCTestCase {
    // swiftlint:disable:next function_body_length
    public func test() throws {
        let add = PostTweetsSearchStreamRulesRequestV2(
            operation: .add([
                .init(value: "value", tag: "tag"),
                .init(value: "hoge"),
            ])
        )

        XCTAssertEqual(add.method, .post)
        XCTAssertEqual(add.path, "/2/tweets/search/stream/rules")
        XCTAssertEqual(add.bodyContentType, .json)

        AssertEqualAnyDict(add.parameters, [:])
        AssertEqualAnyDict(
            add.bodyParameters,
            [
                "add": [
                    ["value": "value", "tag": "tag"],
                    ["value": "hoge"],
                ],
            ]
        )
        AssertEqualAnyDict(add.queryParameters, [:])

        let delete = PostTweetsSearchStreamRulesRequestV2(operation: .delete(["1", "20"]))

        XCTAssertEqual(delete.method, .post)
        XCTAssertEqual(delete.path, "/2/tweets/search/stream/rules")
        XCTAssertEqual(delete.bodyContentType, .json)

        AssertEqualAnyDict(delete.parameters, [:])
        AssertEqualAnyDict(
            delete.bodyParameters,
            [
                "delete": [
                    "ids": ["1", "20"],
                ],
            ]
        )
        AssertEqualAnyDict(delete.queryParameters, [:])
    }

    public func testDryRun() throws {
        let add = PostTweetsSearchStreamRulesRequestV2(
            operation: .add([
                .init(value: "value", tag: "tag"),
                .init(value: "hoge"),
            ]), dryRun: true
        )

        XCTAssertEqual(add.method, .post)
        XCTAssertEqual(add.path, "/2/tweets/search/stream/rules")
        XCTAssertEqual(add.bodyContentType, .json)

        AssertEqualAnyDict(add.parameters, [:])
        AssertEqualAnyDict(
            add.bodyParameters,
            [
                "add": [
                    ["value": "value", "tag": "tag"],
                    ["value": "hoge"],
                ],
            ]
        )

        AssertEqualAnyDict(add.queryParameters, ["dry_run": true])
    }

}
