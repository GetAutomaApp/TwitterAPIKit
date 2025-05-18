// GetAccountVerifyCredentialsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// manage-account-settings/api-reference/get-account-verify_credentials
open class GetAccountVerifyCredentialsRequestV1: TwitterAPIRequest {
    public let skipStatus: Bool?
    public let includeEmail: Bool?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/1.1/account/verify_credentials.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        skipStatus.map { params["skip_status"] = $0 }
        includeEmail.map { params["include_email"] = $0 }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        skipStatus: Bool? = .none,
        includeEmail: Bool? = .none,
        includeEntities: Bool? = .none
    ) {
        self.skipStatus = skipStatus
        self.includeEmail = includeEmail
        self.includeEntities = includeEntities
    }

    deinit {
        // De-init Logic Here
    }
}
