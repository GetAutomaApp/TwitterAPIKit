// PostAccountUpdateProfileRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/post-account-update_profile
public struct PostAccountUpdateProfileRequestV1: TwitterAPIRequest {
    public let url: String?
    public let name: String?
    public let location: String?
    public let skipStatus: Bool?
    public let description: String?
    public let includeEntities: Bool?
    /// ex) F00 , FF0000
    public let profileLinkColor: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/account/update_profile.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        url.map { params["url"] = $0 }
        name.map { params["name"] = $0 }
        location.map { params["location"] = $0 }
        skipStatus.map { params["skip_status"] = $0 }
        description.map { params["description"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        profileLinkColor.map { params["profile_link_color"] = $0 }
        return params
    }

    public init(
        url: String? = .none,
        name: String? = .none,
        location: String? = .none,
        skipStatus: Bool? = .none,
        description: String? = .none,
        includeEntities: Bool? = .none,
        profileLinkColor: String? = .none
    ) {
        self.url = url
        self.name = name
        self.location = location
        self.skipStatus = skipStatus
        self.description = description
        self.includeEntities = includeEntities
        self.profileLinkColor = profileLinkColor
    }

}
