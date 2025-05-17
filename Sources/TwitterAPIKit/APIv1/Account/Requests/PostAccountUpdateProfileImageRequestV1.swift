// PostAccountUpdateProfileImageRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_image
open class PostAccountUpdateProfileImageRequestV1: TwitterAPIRequest {
    public let image: Data
    public let skipStatus: Bool?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/account/update_profile_image.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["image"] = image.base64EncodedString()
        skipStatus.map { params["skip_status"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        image: Data,
        skipStatus: Bool? = .none,
        includeEntities: Bool? = .none
    ) {
        self.image = image
        self.skipStatus = skipStatus
        self.includeEntities = includeEntities
    }

    deinit {
        // De-init Logic Here
    }
}
