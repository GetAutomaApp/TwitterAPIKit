// DeleteUsersRetweetsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request removes a retweet of a specific tweet by the authenticated user.
/// The response includes a confirmation of whether the unretweet was successful.
/// Note: This endpoint requires OAuth 1.0a User Context authentication.
public struct DeleteUsersRetweetsRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterAPISuccessResponseV2
    
    public let method: HTTPMethod = .delete
    public let path: String
    public let parameters: [String: Any]
    
    public init(userId: String, tweetId: String) {
        self.path = "/2/users/\(userId)/retweets/\(tweetId)"
        self.parameters = [:]
    }
} 