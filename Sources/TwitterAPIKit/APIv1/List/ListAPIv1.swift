// ListAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct ListAPIv1: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-list
    public func getLists(
        _ request: GetListsListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-members
    public func getListMembers(
        _ request: GetListsMembersRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-members-show
    public func getListMember(
        _ request: GetListsMembersShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-memberships
    public func getListMemberships(
        _ request: GetListsMembershipsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-ownerships
    public func getListOwnerships(
        _ request: GetListsOwnershipsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-show
    public func getList(
        _ request: GetListsShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-statuses
    public func getListStatuses(
        _ request: GetListsStatusesRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-subscribers
    public func getListSubscribers(
        _ request: GetListsSubscribersRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-subscribers-show
    public func getListSubscriber(
        _ request: GetListsSubscribersShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/get-lists-subscriptions
    public func getListSubscriptions(
        _ request: GetListsSubscriptionsRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-create
    public func postCreateList(
        _ request: PostListsCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-destroy
    public func postDestroyList(
        _ request: PostListsDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-members-create
    public func postAddListMember(
        _ request: PostListsMembersCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-members-create_all
    public func postAddListMembers(
        _ request: PostListsMembersCreateAllRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-members-destroy
    public func postRemoveListMember(
        _ request: PostListsMembersDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-members-destroy_all
    public func postRemoveListMembers(
        _ request: PostListsMembersDestroyAllRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-subscribers-create
    public func postSubscribeList(
        _ request: PostListsSubscribersCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-subscribers-destroy
    public func postUnsubscribeList(
        _ request: PostListsSubscribersDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
    /// create-manage-lists/api-reference/post-lists-update
    public func postUpdateList(
        _ request: PostListsUpdateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
