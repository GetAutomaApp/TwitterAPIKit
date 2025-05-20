// String.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public extension String {
    /// Returns a URL-safe encoded version of the string
    var urlEncodedString: String {
        let allowedCharacterSet = NSMutableCharacterSet.alphanumeric()
        allowedCharacterSet.addCharacters(in: "-._~")
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet as CharacterSet) ?? ""
    }
}
