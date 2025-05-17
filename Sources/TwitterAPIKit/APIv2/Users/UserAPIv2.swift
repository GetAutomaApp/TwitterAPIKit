// UserAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class UserAPIv2: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-id
    public func getUser(
        _ request: GetUserRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users
    public func getUsers(
        _ request: GetUsersRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username
    public func getUserByUsername(
        _ request: GetUsersByUsernameRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by
    public func getUsersByUsernames(
        _ request: GetUsersByRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me
    public func getMe(
        _ request: GetUsersMeRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
