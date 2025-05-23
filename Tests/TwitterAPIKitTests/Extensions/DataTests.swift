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
        XCTContext.runActivity(named: "success") { _ in
            let data = Data("{\"a\":1}".utf8)
            let serialized = data.serialize()
            XCTAssertEqual(serialized.success as? [String: Int], ["a": 1])
        }

        XCTContext.runActivity(named: "failure") { _ in
            let data = Data()
            let serialized = data.serialize()
            guard let error = serialized.error else {
                XCTFail("Expected error but got nil")
                return
            }
            XCTAssertTrue(error.isResponseSerializeFailed)
        }
    }

    public func testDecode() throws {
        struct Obj: Decodable {
            let abc: Int
        }
        XCTContext.runActivity(named: "success") { _ in
            let data = Data("{\"abc\":1}".utf8)
            let serialized = data.decode(Obj.self, decoder: JSONDecoder())
            XCTAssertEqual(serialized.success?.abc, 1)
        }

        XCTContext.runActivity(named: "failure") { _ in
            let data = Data()
            let serialized = data.decode(Obj.self, decoder: JSONDecoder())
            guard let error = serialized.error else {
                XCTFail("Expected error but got nil")
                return
            }
            XCTAssertTrue(error.isResponseSerializeFailed)
        }
    }

    deinit {
        // De-init Logic Here
    }
}
