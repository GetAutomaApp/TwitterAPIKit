// ListAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class ListAPIv2: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-tweets/
    /// api-reference/get-lists-id-tweets
    public func getListTweets(
        _ request: GetListsTweetsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/
    /// api-reference/get-lists-id
    public func getList(
        _ request: GetListRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/
    /// api-reference/get-users-id-owned_lists
    public func getLists(
        _ request: GetUsersOwnedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/
    /// api-reference/post-users-id-followed-lists
    public func followList(
        _ request: PostUsersFollowedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/
    /// api-reference/delete-users-id-followed-lists-list_id
    public func unfollowList(
        _ request: DeleteUsersFollowedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/
    /// api-reference/get-lists-id-followers
    public func listFollowers(
        _ request: GetListsFollowersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/
    /// api-reference/get-users-id-followed_lists
    public func followedLists(
        _ request: GetUsersFollowedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/
    /// api-reference/post-lists-id-members
    public func addListMember(
        _ request: PostListsMembersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/
    /// api-reference/delete-lists-id-members-user_id
    public func removeListMember(
        _ request: DeleteListsMembersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/
    /// api-reference/get-users-id-list_memberships
    public func getListMemberships(
        _ request: GetUsersListMembershipsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-members/
    /// api-reference/get-lists-id-members
    public func getListMembers(
        _ request: GetListsMembersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/
    /// api-reference/post-lists
    public func createList(
        _ request: PostListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/
    /// api-reference/put-lists-id
    public func updateList(
        _ request: PutListRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/
    /// api-reference/delete-lists-id
    public func deleteList(
        _ request: DeleteListRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/
    /// api-reference/get-users-id-pinned_lists
    public func pinnedList(
        _ request: GetUsersPinnedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/
    /// api-reference/post-users-id-pinned-lists
    public func pinList(
        _ request: PostUsersPinnedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/
    /// api-reference/delete-users-id-pinned-lists-list_id
    public func unpinList(
        _ request: DeleteUsersPinnedListsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
