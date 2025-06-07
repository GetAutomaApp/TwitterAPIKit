// GetHelpLanguagesRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/
/// supported-languages/api-reference/get-help-languages
public struct GetHelpLanguagesRequestV1: TwitterAPIRequest {
    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/help/languages.json"
    }

    public var parameters: [String: Any] {
        [:]
    }

    public init() {}

}
