// MultipartFormDataPartTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class MultipartFormDataPartTests: XCTestCase {
    public func testEqualValue() throws {
        let dataA = MultipartFormDataPart.value(name: "n", value: 1)
        let dataB = MultipartFormDataPart.value(name: "n", value: "1")
        let dataC = MultipartFormDataPart.value(name: "n", value: Float(1))
        let dataD = MultipartFormDataPart.value(name: "m", value: 1)

        for combo in [dataA, dataB, dataC, dataD].combinations(ofCount: 2) {
            XCTAssertNotEqual(combo[0], combo[1])
        }
    }

    public func testEqualData() throws {
        let data = Data()
        let dataA = MultipartFormDataPart.data(name: "n", value: data, filename: "f", mimeType: "m")
        let dataB = MultipartFormDataPart.data(name: "m", value: data, filename: "f", mimeType: "m")
        let dataC = MultipartFormDataPart.data(name: "n", value: data, filename: "ff", mimeType: "m")
        let dataD = MultipartFormDataPart.data(name: "n", value: data, filename: "f", mimeType: "mm")
        let dataE = MultipartFormDataPart.data(
            name: "n",
            value: Data(repeating: 1, count: 1),
            filename: "f",
            mimeType: "m"
        )
        let dataF = MultipartFormDataPart.value(name: "n", value: data)

        let dataA1 = MultipartFormDataPart.data(name: "n", value: Data(), filename: "f", mimeType: "m")

        for combo in [dataA, dataB, dataC, dataD, dataE, dataF].combinations(ofCount: 2) {
            XCTAssertNotEqual(combo[0], combo[1])
        }

        XCTAssertEqual(dataA, dataA1)
    }

    deinit {
        // De-init Logic Here
    }
}
