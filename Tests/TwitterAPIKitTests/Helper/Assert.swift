// Assert.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import XCTest

// swiftlint:disable:next identifier_name
internal func AssertEqualAnyDict(
    _ left: [String: Any],
    _ right: [String: Any],
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) {
    // It works well most of the time.
    XCTAssertEqual(NSDictionary(dictionary: left), NSDictionary(dictionary: right), message(), file: file, line: line)
}
