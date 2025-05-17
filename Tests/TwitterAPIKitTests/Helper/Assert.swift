// Assert.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation
import XCTest

// swift-format-ignore: AlwaysUseLowerCamelCase
func AssertEqualAnyDict(
    _ l: [String: Any], _ r: [String: Any], _ message: @autoclosure () -> String = "", file: StaticString = #filePath,
    line: UInt = #line
) {
    // It works well most of the time.
    XCTAssertEqual(NSDictionary(dictionary: l), NSDictionary(dictionary: r), message(), file: file, line: line)
}
