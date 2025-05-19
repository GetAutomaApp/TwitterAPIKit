// FriendshipsAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class FriendshipsAPIv2: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/
    /// api-reference/get-users-id-following
    public func getFollowing(
        _ request: GetUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/
    /// api-reference/get-users-id-followers
    public func getFollowers(
        _ request: GetUsersFollowersRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/
    /// api-reference/post-users-source_user_id-following
    public func follow(
        _ request: PostUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/
    /// api-reference/delete-users-source_id-following
    public func unfollow(
        _ request: DeleteUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
