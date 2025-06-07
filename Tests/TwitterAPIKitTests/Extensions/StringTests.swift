// StringTests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal class StringTests: XCTestCase {
    /// https://developer.twitter.com/en/docs/authentication/oauth-1-0a/percent-encoding-parameters
    public func testEncode() throws {
        XCTAssertEqual("Ladies + Gentlemen".urlEncodedString, "Ladies%20%2B%20Gentlemen")
        XCTAssertEqual("An encoded string!".urlEncodedString, "An%20encoded%20string%21")
        XCTAssertEqual("Dogs, Cats & Mice".urlEncodedString, "Dogs%2C%20Cats%20%26%20Mice")
        XCTAssertEqual("☃".urlEncodedString, "%E2%98%83")
        XCTAssertEqual("1970-01-01T00:01:00Z".urlEncodedString, "1970-01-01T00%3A01%3A00Z")
    }

}
