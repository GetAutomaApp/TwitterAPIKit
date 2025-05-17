// PostUsersMutingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/post-users-user_id-muting
open class PostUsersMutingRequestV2: TwitterAPIRequest {
    public let id: String
    public let targetUserID: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/2/users/\(id)/muting"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["target_user_id"] = targetUserID
        return params
    }

    public init(
        id: String,
        targetUserID: String
    ) {
        self.id = id
        self.targetUserID = targetUserID
    }
    deinit {
        // de-init logic here
    }
}
