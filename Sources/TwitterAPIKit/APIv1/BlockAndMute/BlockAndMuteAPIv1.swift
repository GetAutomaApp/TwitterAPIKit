// BlockAndMuteAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class BlockAndMuteAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/get-blocks-ids
    public func getBlockIDs(
        _ request: GetBlocksIDsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/get-blocks-list
    public func getBlockUsers(
        _ request: GetBlocksListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/get-mutes-users-ids
    public func getMuteIDs(
        _ request: GetMutesUsersIDsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/get-mutes-users-list
    public func getMuteUsers(
        _ request: GetMutesUsersListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/post-blocks-create
    public func postBlockUser(
        _ request: PostBlocksCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/post-blocks-destroy
    public func postUnblockUser(
        _ request: PostBlocksDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/post-mutes-users-create
    public func postMuteUser(
        _ request: PostMutesUsersCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/post-mutes-users-destroy
    public func postUnmuteUser(
        _ request: PostMutesUsersDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/
    /// api-reference/post-users-report_spam
    public func postReportSpam(
        _ request: PostUsersReportSpamRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
