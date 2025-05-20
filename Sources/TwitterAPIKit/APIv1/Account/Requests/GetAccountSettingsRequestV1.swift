// GetAccountSettingsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/get-account-settings
open class GetAccountSettingsRequestV1: TwitterAPIRequest {
    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/account/settings.json"
    }

    open var parameters: [String: Any] {
        [:]
    }

    public init() {}

    deinit {
        // De-init Logic Here
    }
}
