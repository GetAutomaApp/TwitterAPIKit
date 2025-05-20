// BlockAndMuteAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class BlockAndMuteAPIv2: TwitterAPIBase {
    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/get-users-blocking
    public func getBlockUsers(
        _ request: GetUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/post-users-user_id-blocking
    public func blockUser(
        _ request: PostUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/delete-users-user_id-blocking
    public func unblockUser(
        _ request: DeleteUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/get-users-muting
    public func getMuteUsers(
        _ request: GetUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/post-users-user_id-muting
    public func muteUser(
        _ request: PostUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/delete-users-user_id-muting
    public func unmuteUser(
        _ request: DeleteUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
