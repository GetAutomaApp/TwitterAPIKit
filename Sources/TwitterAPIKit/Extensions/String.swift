// String.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

extension String {
    public var urlEncodedString: String {
        let allowedCharacterSet = NSMutableCharacterSet.alphanumeric()
        allowedCharacterSet.addCharacters(in: "-._~")
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet as CharacterSet)!
    }
}
