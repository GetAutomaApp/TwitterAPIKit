// UserAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct UserAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-id
    public func getUser(
        _ request: GetUserRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users
    public func getUsers(
        _ request: GetUsersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username
    public func getUserByUsername(
        _ request: GetUsersByUsernameRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by
    public func getUsersByUsernames(
        _ request: GetUsersByRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me
    public func getMe(
        _ request: GetUsersMeRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
