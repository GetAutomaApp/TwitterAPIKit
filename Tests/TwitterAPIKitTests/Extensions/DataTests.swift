// DataTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal class DataTests: XCTestCase {
    public func testSerialize() throws {
        let data = Data("{\"a\":1}".utf8)
        let serialized = data.serialize()
        XCTAssertEqual(serialized.success as? [String: Int], ["a": 1])

        let data2 = Data()
        let serialized2 = data2.serialize()
        guard let error = serialized2.error else {
            XCTFail("Expected error but got nil")
            return
        }
        XCTAssertTrue(error.isResponseSerializeFailed)
    }

    public func testDecode() throws {
        struct Obj: Decodable {
            let abc: Int
        }
        let data = Data("{\"abc\":1}".utf8)
        let serialized = data.decode(Obj.self, decoder: JSONDecoder())
        XCTAssertEqual(serialized.success?.abc, 1)

        let data2 = Data()
        let serialized2 = data2.decode(Obj.self, decoder: JSONDecoder())
        guard let error = serialized2.error else {
            XCTFail("Expected error but got nil")
            return
        }
        XCTAssertTrue(error.isResponseSerializeFailed)
    }

    deinit {
        // De-init Logic Here
    }
}
