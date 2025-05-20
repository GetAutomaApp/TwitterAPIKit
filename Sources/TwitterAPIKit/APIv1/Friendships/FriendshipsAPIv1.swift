// FriendshipsAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class FriendshipsAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-followers-ids
    public func getFollowerIDs(
        _ request: GetFollowersIDsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-followers-list
    public func getFollowers(
        _ request: GetFollowersListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friends-ids
    public func getFriendIDs(
        _ request: GetFriendsIDsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friends-list
    public func getFriends(
        _ request: GetFriendsListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friendships-incoming
    public func getFriendshipsIncoming(
        _ request: GetFriendshipsIncomingRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friendships-lookup
    public func getFriendshipsLookup(
        _ request: GetFriendshipsLookupRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friendships-no_retweets-ids
    public func getFriendshipsNoRetweetsIDs(
        _ request: GetFriendshipsNoRetweetsIDsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friendships-outgoing
    public func getFriendshipsOutgoing(
        _ request: GetFriendshipsOutgoingRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/get-friendships-show
    public func getFriendships(
        _ request: GetFriendshipsShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/post-friendships-create
    public func postFollowUser(
        _ request: PostFriendshipsCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/post-friendships-destroy
    public func postUnfollowUser(
        _ request: PostFriendshipsDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/
    /// api-reference/post-friendships-update
    public func postFriendshipsUpdate(
        _ request: PostFriendshipsUpdateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
