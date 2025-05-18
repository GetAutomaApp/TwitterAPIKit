// PostAccountUpdateProfileBannerRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/post-account-update_profile_banner
open class PostAccountUpdateProfileBannerRequestV1: TwitterAPIRequest {
    public let banner: Data
    public let width: Int?
    public let height: Int?
    public let offsetTop: Int?
    public let offsetLeft: Int?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/account/update_profile_banner.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["banner"] = banner.base64EncodedString()
        width.map { params["width"] = $0 }
        height.map { params["height"] = $0 }
        offsetTop.map { params["offset_top"] = $0 }
        offsetLeft.map { params["offset_left"] = $0 }
        return params
    }

    public init(
        banner: Data,
        width: Int? = .none,
        height: Int? = .none,
        offsetTop: Int? = .none,
        offsetLeft: Int? = .none
    ) {
        self.banner = banner
        self.width = width
        self.height = height
        self.offsetTop = offsetTop
        self.offsetLeft = offsetLeft
    }

    deinit {
        // De-init Logic Here
    }
}
