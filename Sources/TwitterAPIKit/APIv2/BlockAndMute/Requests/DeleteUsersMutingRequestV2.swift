// DeleteUsersMutingRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/delete-users-user_id-muting
open class DeleteUsersMutingRequestV2: TwitterAPIRequest {
    public let sourceUserID: String
    public let targetUserID: String

    public var method: HTTPMethod {
        return .delete
    }

    public var path: String {
        return "/2/users/\(sourceUserID)/muting/\(targetUserID)"
    }

    open var parameters: [String: Any] {
        return [:]
    }

    public init(
        sourceUserID: String,
        targetUserID: String
    ) {
        self.sourceUserID = sourceUserID
        self.targetUserID = targetUserID
    }
    deinit {
        // de-init logic here
    }
}
