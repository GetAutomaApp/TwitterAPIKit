// AccountAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class AccountAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/get-account-settings
    public func getAccountSetting(
        _ request: GetAccountSettingsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/get-account-verify_credentials
    public func getAccountVerify(
        _ request: GetAccountVerifyCredentialsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-account-remove_profile_banner
    public func postRemoveProfileBanner(
        _ request: PostAccountRemoveProfileBannerRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-account-settings
    public func postAccountSettings(
        _ request: PostAccountSettingsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-account-update_profile
    public func postAccountProfile(
        _ request: PostAccountUpdateProfileRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-account-update_profile_banner
    public func postProfileBanner(
        _ request: PostAccountUpdateProfileBannerRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// manage-account-settings/api-reference/post-account-update_profile_image
    public func postProfileImage(
        _ request: PostAccountUpdateProfileImageRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
