// GetUsersProfileBannerRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/get-users-profile_banner
public struct GetUsersProfileBannerRequestV1: TwitterAPIRequest {
    public let user: TwitterUserIdentifierV1

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/users/profile_banner.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        user.bind(param: &params)
        return params
    }

    public init(
        user: TwitterUserIdentifierV1
    ) {
        self.user = user
    }

}
