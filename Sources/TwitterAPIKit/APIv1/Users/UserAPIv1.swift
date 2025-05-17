// UserAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class UserAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-users-lookup
    public func getUsers(
        _ request: GetUsersLookupRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-users-show
    public func getUser(
        _ request: GetUsersShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-users-search
    public func searchUser(
        _ request: GetUsersShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/
    /// api-reference/get-users-profile_banner
    public func getUserProfileBanner(
        _ request: GetUsersProfileBannerRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
