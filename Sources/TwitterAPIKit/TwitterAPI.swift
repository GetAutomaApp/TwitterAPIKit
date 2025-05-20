// TwitterAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

// swift-format-ignore-file
import Foundation

/// A protocol that represents a Twitter API.
public protocol TwitterAPI {
    // No Logic Here
}

/// Extension providing OAuth authentication methods for the Twitter API.
public extension TwitterAuthAPI: TwitterAPI {
    // MARK: - OAuth10aAPI

    /// Requests an OAuth request token from Twitter.
    /// - Parameter request: The request parameters for obtaining a request token.
    /// - Returns: A data task that will return the raw response data.
    func postOAuthRequestTokenData(_ request: PostOAuthRequestTokenRequestV1) -> TwitterAPISessionDataTask {
        oauth10a.postOAuthRequestTokenData(request)
    }

    /// Requests an OAuth request token from Twitter and parses the response.
    /// - Parameter request: The request parameters for obtaining a request token.
    /// - Returns: A specialized task that will return a parsed OAuth token.
    func postOAuthRequestToken(_ request: PostOAuthRequestTokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuthTokenV1>
    {
        oauth10a.postOAuthRequestToken(request)
    }

    /// Creates a URL for authorizing the application with OAuth.
    /// - Parameter request: The request parameters for creating the authorization URL.
    /// - Returns: The authorization URL if it can be created, nil otherwise.
    func makeOAuthAuthorizeURL(_ request: GetOAuthAuthorizeRequestV1) -> URL? {
        oauth10a.makeOAuthAuthorizeURL(request)
    }

    /// Creates a URL for authenticating with OAuth.
    /// - Parameter request: The request parameters for creating the authentication URL.
    /// - Returns: The authentication URL if it can be created, nil otherwise.
    func makeOAuthAuthenticateURL(_ request: GetOAuthAuthenticateRequestV1) -> URL? {
        oauth10a.makeOAuthAuthenticateURL(request)
    }

    /// Requests an OAuth access token from Twitter.
    /// - Parameter request: The request parameters for obtaining an access token.
    /// - Returns: A data task that will return the raw response data.
    func postOAuthAccessTokenData(_ request: PostOAuthAccessTokenRequestV1) -> TwitterAPISessionDataTask {
        oauth10a.postOAuthAccessTokenData(request)
    }

    /// Requests an OAuth access token from Twitter and parses the response.
    /// - Parameter request: The request parameters for obtaining an access token.
    /// - Returns: A specialized task that will return a parsed OAuth access token.
    func postOAuthAccessToken(_ request: PostOAuthAccessTokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuthAccessTokenV1>
    {
        oauth10a.postOAuthAccessToken(request)
    }

    /// Invalidates the current OAuth access token.
    /// - Parameter request: The request parameters for invalidating the token.
    /// - Returns: A JSON task that will return the response.
    func postInvalidateAccessToken(_ request: PostOAuthInvalidateTokenRequestV1) -> TwitterAPISessionJSONTask {
        oauth10a.postInvalidateAccessToken(request)
    }

    // MARK: - OAuth20API

    /// Requests an OAuth 2.0 bearer token from Twitter.
    /// - Parameter request: The request parameters for obtaining a bearer token.
    /// - Returns: A data task that will return the raw response data.
    func postOAuth2BearerTokenData(_ request: PostOAuth2TokenRequestV1) -> TwitterAPISessionDataTask {
        oauth20.postOAuth2BearerTokenData(request)
    }

    /// Requests an OAuth 2.0 bearer token from Twitter and parses the response.
    /// - Parameter request: The request parameters for obtaining a bearer token.
    /// - Returns: A specialized task that will return a parsed OAuth 2.0 bearer token.
    func postOAuth2BearerToken(_ request: PostOAuth2TokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2BearerToken>
    {
        oauth20.postOAuth2BearerToken(request)
    }

    /// Invalidates the current OAuth 2.0 bearer token.
    /// - Parameter request: The request parameters for invalidating the token.
    /// - Returns: A JSON task that will return the response.
    func postInvalidateOAuth2BearerToken(_ request: PostOAuth2InvalidateTokenRequestV1) -> TwitterAPISessionJSONTask {
        oauth20.postInvalidateOAuth2BearerToken(request)
    }

    /// Creates a URL for OAuth 2.0 authorization.
    /// - Parameter request: The request parameters for creating the authorization URL.
    /// - Returns: The authorization URL if it can be created, nil otherwise.
    func makeOAuth2AuthorizeURL(_ request: GetOAuth2AuthorizeRequestV1) -> URL? {
        oauth20.makeOAuth2AuthorizeURL(request)
    }

    /// Requests an OAuth 2.0 access token from Twitter.
    /// - Parameter request: The request parameters for obtaining an access token.
    /// - Returns: A data task that will return the raw response data.
    func postOAuth2AccessTokenData(_ request: PostOAuth2AccessTokenRequestV2) -> TwitterAPISessionDataTask {
        oauth20.postOAuth2AccessTokenData(request)
    }

    /// Requests an OAuth 2.0 access token from Twitter and parses the response.
    /// - Parameter request: The request parameters for obtaining an access token.
    /// - Returns: A specialized task that will return a parsed OAuth 2.0 access token.
    func postOAuth2AccessToken(_ request: PostOAuth2AccessTokenRequestV2)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2AccessToken>
    {
        oauth20.postOAuth2AccessToken(request)
    }

    /// Requests a refresh of the OAuth 2.0 access token.
    /// - Parameter request: The request parameters for refreshing the token.
    /// - Returns: A data task that will return the raw response data.
    func postOAuth2RefreshTokenData(_ request: PostOAuth2RefreshTokenRequestV2) -> TwitterAPISessionDataTask {
        oauth20.postOAuth2RefreshTokenData(request)
    }

    /// Requests a refresh of the OAuth 2.0 access token and parses the response.
    /// - Parameter request: The request parameters for refreshing the token.
    /// - Returns: A specialized task that will return a parsed OAuth 2.0 access token.
    func postOAuth2RefreshToken(_ request: PostOAuth2RefreshTokenRequestV2)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2AccessToken>
    {
        oauth20.postOAuth2RefreshToken(request)
    }

    /// Revokes an OAuth 2.0 token.
    /// - Parameter request: The request parameters for revoking the token.
    /// - Returns: A data task that will return the response.
    func postOAuth2RevokeToken(_ request: PostOAuth2RevokeTokenRequestV2) -> TwitterAPISessionDataTask {
        oauth20.postOAuth2RevokeToken(request)
    }
}

/// Extension providing Twitter API v1 endpoints.
public extension TwitterAPIv1: TwitterAPI {
    // MARK: - AccountAPIv1

    /// Retrieves the current account settings.
    /// - Parameter request: The request parameters for retrieving account settings.
    /// - Returns: A JSON task that will return the account settings.
    func getAccountSetting(_ request: GetAccountSettingsRequestV1) -> TwitterAPISessionJSONTask {
        account.getAccountSetting(request)
    }

    /// Verifies the credentials of the current user.
    /// - Parameter request: The request parameters for verifying credentials.
    /// - Returns: A JSON task that will return the verification result.
    func getAccountVerify(_ request: GetAccountVerifyCredentialsRequestV1) -> TwitterAPISessionJSONTask {
        account.getAccountVerify(request)
    }

    /// Removes the profile banner for the authenticated user.
    /// - Parameter request: The request parameters for removing the profile banner.
    /// - Returns: A JSON task that will return the response.
    func postRemoveProfileBanner(_ request: PostAccountRemoveProfileBannerRequestV1) -> TwitterAPISessionJSONTask {
        account.postRemoveProfileBanner(request)
    }

    /// Updates the account settings for the authenticated user.
    /// - Parameter request: The request parameters containing the new settings.
    /// - Returns: A JSON task that will return the updated settings.
    func postAccountSettings(_ request: PostAccountSettingsRequestV1) -> TwitterAPISessionJSONTask {
        account.postAccountSettings(request)
    }

    /// Updates the profile information for the authenticated user.
    /// - Parameter request: The request parameters containing the new profile information.
    /// - Returns: A JSON task that will return the updated profile.
    func postAccountProfile(_ request: PostAccountUpdateProfileRequestV1) -> TwitterAPISessionJSONTask {
        account.postAccountProfile(request)
    }

    /// Updates the profile banner for the authenticated user.
    /// - Parameter request: The request parameters containing the new banner image.
    /// - Returns: A data task that will return the response.
    func postProfileBanner(_ request: PostAccountUpdateProfileBannerRequestV1) -> TwitterAPISessionDataTask {
        account.postProfileBanner(request)
    }

    /// Updates the profile image for the authenticated user.
    /// - Parameter request: The request parameters containing the new profile image.
    /// - Returns: A JSON task that will return the response.
    func postProfileImage(_ request: PostAccountUpdateProfileImageRequestV1) -> TwitterAPISessionJSONTask {
        account.postProfileImage(request)
    }

    // MARK: - ApplicationAPIv1

    /// Retrieves the current rate limit status for the application.
    /// - Parameter request: The request parameters for retrieving rate limit status.
    /// - Returns: A JSON task that will return the rate limit information.
    func getRateLimit(_ request: GetApplicationRateLimitStatusRequestV1) -> TwitterAPISessionJSONTask {
        application.getRateLimit(request)
    }

    // MARK: - BlockAndMuteAPIv1

    /// Retrieves the IDs of users blocked by the authenticated user.
    /// - Parameter request: The request parameters for retrieving blocked user IDs.
    /// - Returns: A JSON task that will return the list of blocked user IDs.
    func getBlockIDs(_ request: GetBlocksIDsRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.getBlockIDs(request)
    }

    /// Retrieves detailed information about users blocked by the authenticated user.
    /// - Parameter request: The request parameters for retrieving blocked users.
    /// - Returns: A JSON task that will return the list of blocked users.
    func getBlockUsers(_ request: GetBlocksListRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.getBlockUsers(request)
    }

    /// Retrieves the IDs of users muted by the authenticated user.
    /// - Parameter request: The request parameters for retrieving muted user IDs.
    /// - Returns: A JSON task that will return the list of muted user IDs.
    func getMuteIDs(_ request: GetMutesUsersIDsRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.getMuteIDs(request)
    }

    /// Retrieves detailed information about users muted by the authenticated user.
    /// - Parameter request: The request parameters for retrieving muted users.
    /// - Returns: A JSON task that will return the list of muted users.
    func getMuteUsers(_ request: GetMutesUsersListRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.getMuteUsers(request)
    }

    /// Blocks a user.
    /// - Parameter request: The request parameters containing the user to block.
    /// - Returns: A JSON task that will return the blocked user information.
    func postBlockUser(_ request: PostBlocksCreateRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.postBlockUser(request)
    }

    /// Unblocks a user.
    /// - Parameter request: The request parameters containing the user to unblock.
    /// - Returns: A JSON task that will return the unblocked user information.
    func postUnblockUser(_ request: PostBlocksDestroyRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.postUnblockUser(request)
    }

    /// Mutes a user.
    /// - Parameter request: The request parameters containing the user to mute.
    /// - Returns: A JSON task that will return the muted user information.
    func postMuteUser(_ request: PostMutesUsersCreateRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.postMuteUser(request)
    }

    /// Unmutes a user.
    /// - Parameter request: The request parameters containing the user to unmute.
    /// - Returns: A JSON task that will return the unmuted user information.
    func postUnmuteUser(_ request: PostMutesUsersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.postUnmuteUser(request)
    }

    /// Reports a user as spam.
    /// - Parameter request: The request parameters containing the user to report.
    /// - Returns: A JSON task that will return the response.
    func postReportSpam(_ request: PostUsersReportSpamRequestV1) -> TwitterAPISessionJSONTask {
        blockAndMute.postReportSpam(request)
    }

    // MARK: - CollectionAPIv1

    /// Retrieves entries from a collection.
    /// - Parameter request: The request parameters for retrieving collection entries.
    /// - Returns: A JSON task that will return the collection entries.
    func getCollectionEntries(_ request: GetCollectionsEntriesRequestV1) -> TwitterAPISessionJSONTask {
        collection.getCollectionEntries(request)
    }

    /// Retrieves a list of collections owned by a user.
    /// - Parameter request: The request parameters for retrieving collections.
    /// - Returns: A JSON task that will return the list of collections.
    func getCollections(_ request: GetCollectionsListRequestV1) -> TwitterAPISessionJSONTask {
        collection.getCollections(request)
    }

    /// Retrieves information about a specific collection.
    /// - Parameter request: The request parameters for retrieving the collection.
    /// - Returns: A JSON task that will return the collection information.
    func getCollection(_ request: GetCollectionsShowRequestV1) -> TwitterAPISessionJSONTask {
        collection.getCollection(request)
    }

    /// Creates a new collection.
    /// - Parameter request: The request parameters for creating the collection.
    /// - Returns: A JSON task that will return the created collection.
    func postCreateCollection(_ request: PostCollectionsCreateRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCreateCollection(request)
    }

    /// Deletes a collection.
    /// - Parameter request: The request parameters for deleting the collection.
    /// - Returns: A JSON task that will return the response.
    func postDestroyCollection(_ request: PostCollectionsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        collection.postDestroyCollection(request)
    }

    /// Adds a tweet to a collection.
    /// - Parameter request: The request parameters for adding the tweet.
    /// - Returns: A JSON task that will return the response.
    func postCollectionAddEntry(_ request: PostCollectionsEntriesAddRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCollectionAddEntry(request)
    }

    /// Curates tweets in a collection.
    /// - Parameter request: The request parameters for curating the collection.
    /// - Returns: A JSON task that will return the response.
    func postCollectionCurate(_ request: PostCollectionsEntriesCurateRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCollectionCurate(request)
    }

    /// Moves a tweet to a different position in a collection.
    /// - Parameter request: The request parameters for moving the tweet.
    /// - Returns: A JSON task that will return the response.
    func postCollectionMoveEntry(_ request: PostCollectionsEntriesMoveRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCollectionMoveEntry(request)
    }

    /// Removes a tweet from a collection.
    /// - Parameter request: The request parameters for removing the tweet.
    /// - Returns: A JSON task that will return the response.
    func postCollectionRemoveEntry(_ request: PostCollectionsEntriesRemoveRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCollectionRemoveEntry(request)
    }

    /// Updates a collection's metadata.
    /// - Parameter request: The request parameters containing the updated metadata.
    /// - Returns: A JSON task that will return the updated collection.
    func postCollectionUpdate(_ request: PostCollectionsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        collection.postCollectionUpdate(request)
    }

    // MARK: - DirectMessageAPIv1

    /// Sends a new direct message.
    /// - Parameter request: The request parameters containing the message content.
    /// - Returns: A JSON task that will return the sent message.
    func postDirectMessage(_ request: PostDirectMessageRequestV1) -> TwitterAPISessionJSONTask {
        directMessage.postDirectMessage(request)
    }

    /// Deletes a direct message.
    /// - Parameter request: The request parameters containing the message to delete.
    /// - Returns: A data task that will return the response.
    func deleteDirectMessage(_ request: DeleteDirectMessageRequestV1) -> TwitterAPISessionDataTask {
        directMessage.deleteDirectMessage(request)
    }

    /// Retrieves a specific direct message.
    /// - Parameter request: The request parameters for retrieving the message.
    /// - Returns: A JSON task that will return the message.
    func getDirectMessage(_ request: GetDirectMessageRequestV1) -> TwitterAPISessionJSONTask {
        directMessage.getDirectMessage(request)
    }

    /// Retrieves a list of direct messages.
    /// - Parameter request: The request parameters for retrieving messages.
    /// - Returns: A JSON task that will return the list of messages.
    func getDirectMessageList(_ request: GetDirectMessageListRequestV1) -> TwitterAPISessionJSONTask {
        directMessage.getDirectMessageList(request)
    }

    /// Marks a direct message as read.
    /// - Parameter request: The request parameters containing the message to mark.
    /// - Returns: A data task that will return the response.
    func postDirectMessageMarkRead(_ request: PostDirectMessagesMarkReadRequestV1) -> TwitterAPISessionDataTask {
        directMessage.postDirectMessageMarkRead(request)
    }

    /// Indicates that the user is typing a direct message.
    /// - Parameter request: The request parameters for the typing indicator.
    /// - Returns: A data task that will return the response.
    func postDirectMessageTypingIndicator(_ request: PostDirectMessagesIndicateTypingRequestV1)
        -> TwitterAPISessionDataTask
    {
        directMessage.postDirectMessageTypingIndicator(request)
    }

    // MARK: - FavoriteAPIv1

    /// Favorites (likes) a tweet.
    /// - Parameter request: The request parameters containing the tweet to favorite.
    /// - Returns: A JSON task that will return the favorited tweet.
    func postFavorite(_ request: PostFavoriteRequestV1) -> TwitterAPISessionJSONTask {
        favorite.postFavorite(request)
    }

    /// Removes a favorite (unlike) from a tweet.
    /// - Parameter request: The request parameters containing the tweet to unfavorite.
    /// - Returns: A JSON task that will return the unfavorited tweet.
    func postUnFavorite(_ request: PostUnFavoriteRequestV1) -> TwitterAPISessionJSONTask {
        favorite.postUnFavorite(request)
    }

    /// Retrieves tweets favorited by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of favorited tweets.
    func getFavorites(_ request: GetFavoritesRequestV1) -> TwitterAPISessionJSONTask {
        favorite.getFavorites(request)
    }

    // MARK: - FriendshipsAPIv1

    /// Retrieves IDs of users following a specified user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of follower IDs.
    func getFollowerIDs(_ request: GetFollowersIDsRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFollowerIDs(request)
    }

    /// Retrieves detailed information about users following a specified user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of followers.
    func getFollowers(_ request: GetFollowersListRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFollowers(request)
    }

    /// Retrieves IDs of users a specified user is following.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of friend IDs.
    func getFriendIDs(_ request: GetFriendsIDsRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendIDs(request)
    }

    /// Retrieves detailed information about users a specified user is following.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of friends.
    func getFriends(_ request: GetFriendsListRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriends(request)
    }

    /// Retrieves incoming follow requests for the authenticated user.
    /// - Parameter request: The request parameters for retrieving incoming requests.
    /// - Returns: A JSON task that will return the list of pending followers.
    func getFriendshipsIncoming(_ request: GetFriendshipsIncomingRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendshipsIncoming(request)
    }

    /// Retrieves detailed friendship information between users.
    /// - Parameter request: The request parameters containing the user identifiers.
    /// - Returns: A JSON task that will return the friendship details.
    func getFriendshipsLookup(_ request: GetFriendshipsLookupRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendshipsLookup(request)
    }

    /// Retrieves IDs of users whose retweets are disabled.
    /// - Parameter request: The request parameters for retrieving no-retweet IDs.
    /// - Returns: A JSON task that will return the list of user IDs.
    func getFriendshipsNoRetweetsIDs(_ request: GetFriendshipsNoRetweetsIDsRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendshipsNoRetweetsIDs(request)
    }

    /// Retrieves outgoing follow requests from the authenticated user.
    /// - Parameter request: The request parameters for retrieving outgoing requests.
    /// - Returns: A JSON task that will return the list of pending friends.
    func getFriendshipsOutgoing(_ request: GetFriendshipsOutgoingRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendshipsOutgoing(request)
    }

    /// Retrieves detailed friendship information between two users.
    /// - Parameter request: The request parameters containing the user identifiers.
    /// - Returns: A JSON task that will return the friendship details.
    func getFriendships(_ request: GetFriendshipsShowRequestV1) -> TwitterAPISessionJSONTask {
        friendships.getFriendships(request)
    }

    /// Follows a user.
    /// - Parameter request: The request parameters containing the user to follow.
    /// - Returns: A JSON task that will return the followed user information.
    func postFollowUser(_ request: PostFriendshipsCreateRequestV1) -> TwitterAPISessionJSONTask {
        friendships.postFollowUser(request)
    }

    /// Unfollows a user.
    /// - Parameter request: The request parameters containing the user to unfollow.
    /// - Returns: A JSON task that will return the unfollowed user information.
    func postUnfollowUser(_ request: PostFriendshipsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        friendships.postUnfollowUser(request)
    }

    /// Updates friendship settings with a user.
    /// - Parameter request: The request parameters containing the settings to update.
    /// - Returns: A JSON task that will return the updated friendship information.
    func postFriendshipsUpdate(_ request: PostFriendshipsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        friendships.postFriendshipsUpdate(request)
    }

    // MARK: - GeoAPIv1

    /// Retrieves location information for given coordinates.
    /// - Parameter request: The request parameters containing the coordinates.
    /// - Returns: A JSON task that will return the location information.
    func getReverseGeocode(_ request: GetGeoReverseGeocodeRequestV1) -> TwitterAPISessionJSONTask {
        geo.getReverseGeocode(request)
    }

    /// Retrieves information about a specific place.
    /// - Parameter request: The request parameters containing the place ID.
    /// - Returns: A JSON task that will return the place information.
    func getGeoPlace(_ request: GetGeoPlaceIDRequestV1) -> TwitterAPISessionJSONTask {
        geo.getGeoPlace(request)
    }

    /// Searches for places matching specified criteria.
    /// - Parameter request: The request parameters containing the search criteria.
    /// - Returns: A JSON task that will return the matching places.
    func searchGeo(_ request: GetGeoSearchRequestV1) -> TwitterAPISessionJSONTask {
        geo.searchGeo(request)
    }

    // MARK: - HelpAPIv1

    /// Retrieves the list of languages supported by Twitter.
    /// - Parameter request: The request parameters for retrieving languages.
    /// - Returns: A JSON task that will return the supported languages.
    func getSupportedLanguages(_ request: GetHelpLanguagesRequestV1) -> TwitterAPISessionJSONTask {
        help.getSupportedLanguages(request)
    }

    // MARK: - ListAPIv1

    /// Retrieves lists owned by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the owned lists.
    func getLists(_ request: GetListsListRequestV1) -> TwitterAPISessionJSONTask {
        list.getLists(request)
    }

    /// Retrieves members of a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list members.
    func getListMembers(_ request: GetListsMembersRequestV1) -> TwitterAPISessionJSONTask {
        list.getListMembers(request)
    }

    /// Checks if a user is a member of a list.
    /// - Parameter request: The request parameters containing the user and list identifiers.
    /// - Returns: A JSON task that will return the membership status.
    func getListMember(_ request: GetListsMembersShowRequestV1) -> TwitterAPISessionJSONTask {
        list.getListMember(request)
    }

    /// Retrieves lists that a user is a member of.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list memberships.
    func getListMemberships(_ request: GetListsMembershipsRequestV1) -> TwitterAPISessionJSONTask {
        list.getListMemberships(request)
    }

    /// Retrieves lists owned by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the owned lists.
    func getListOwnerships(_ request: GetListsOwnershipsRequestV1) -> TwitterAPISessionJSONTask {
        list.getListOwnerships(request)
    }

    /// Retrieves information about a specific list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list information.
    func getList(_ request: GetListsShowRequestV1) -> TwitterAPISessionJSONTask {
        list.getList(request)
    }

    /// Retrieves tweets from a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list tweets.
    func getListStatuses(_ request: GetListsStatusesRequestV1) -> TwitterAPISessionJSONTask {
        list.getListStatuses(request)
    }

    /// Retrieves subscribers of a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list subscribers.
    func getListSubscribers(_ request: GetListsSubscribersRequestV1) -> TwitterAPISessionJSONTask {
        list.getListSubscribers(request)
    }

    /// Checks if a user is subscribed to a list.
    /// - Parameter request: The request parameters containing the user and list identifiers.
    /// - Returns: A JSON task that will return the subscription status.
    func getListSubscriber(_ request: GetListsSubscribersShowRequestV1) -> TwitterAPISessionJSONTask {
        list.getListSubscriber(request)
    }

    /// Retrieves lists that a user is subscribed to.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the subscribed lists.
    func getListSubscriptions(_ request: GetListsSubscriptionsRequestV1) -> TwitterAPISessionJSONTask {
        list.getListSubscriptions(request)
    }

    /// Creates a new list.
    /// - Parameter request: The request parameters for creating the list.
    /// - Returns: A JSON task that will return the created list.
    func postCreateList(_ request: PostListsCreateRequestV1) -> TwitterAPISessionJSONTask {
        list.postCreateList(request)
    }

    /// Deletes a list.
    /// - Parameter request: The request parameters containing the list to delete.
    /// - Returns: A JSON task that will return the response.
    func postDestroyList(_ request: PostListsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        list.postDestroyList(request)
    }

    /// Adds a member to a list.
    /// - Parameter request: The request parameters containing the user and list.
    /// - Returns: A JSON task that will return the response.
    func postAddListMember(_ request: PostListsMembersCreateRequestV1) -> TwitterAPISessionJSONTask {
        list.postAddListMember(request)
    }

    /// Adds multiple members to a list.
    /// - Parameter request: The request parameters containing the users and list.
    /// - Returns: A JSON task that will return the response.
    func postAddListMembers(_ request: PostListsMembersCreateAllRequestV1) -> TwitterAPISessionJSONTask {
        list.postAddListMembers(request)
    }

    /// Removes a member from a list.
    /// - Parameter request: The request parameters containing the user and list.
    /// - Returns: A JSON task that will return the response.
    func postRemoveListMember(_ request: PostListsMembersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        list.postRemoveListMember(request)
    }

    /// Removes multiple members from a list.
    /// - Parameter request: The request parameters containing the users and list.
    /// - Returns: A JSON task that will return the response.
    func postRemoveListMembers(_ request: PostListsMembersDestroyAllRequestV1) -> TwitterAPISessionJSONTask {
        list.postRemoveListMembers(request)
    }

    /// Subscribes the authenticated user to a list.
    /// - Parameter request: The request parameters containing the list to subscribe to.
    /// - Returns: A JSON task that will return the response.
    func postSubscribeList(_ request: PostListsSubscribersCreateRequestV1) -> TwitterAPISessionJSONTask {
        list.postSubscribeList(request)
    }

    /// Unsubscribes the authenticated user from a list.
    /// - Parameter request: The request parameters containing the list to unsubscribe from.
    /// - Returns: A JSON task that will return the response.
    func postUnsubscribeList(_ request: PostListsSubscribersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        list.postUnsubscribeList(request)
    }

    /// Updates a list's metadata.
    /// - Parameter request: The request parameters containing the updated information.
    /// - Returns: A JSON task that will return the updated list.
    func postUpdateList(_ request: PostListsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        list.postUpdateList(request)
    }

    // MARK: - MediaAPIv1

    /// Retrieves the status of a media upload.
    /// - Parameter request: The request parameters for checking upload status.
    /// - Returns: A JSON task that will return the upload status.
    func getUploadMediaStatus(_ request: GetUploadMediaStatusRequestV1) -> TwitterAPISessionJSONTask {
        media.getUploadMediaStatus(request)
    }

    /// Initializes a media upload.
    /// - Parameter request: The request parameters for initializing the upload.
    /// - Returns: A JSON task that will return the initialization response.
    func uploadMediaInit(_ request: UploadMediaInitRequestV1) -> TwitterAPISessionJSONTask {
        media.uploadMediaInit(request)
    }

    /// Appends media data to an initialized upload.
    /// - Parameter request: The request parameters containing the media chunk.
    /// - Returns: A JSON task that will return the append response.
    func uploadMediaAppend(_ request: UploadMediaAppendRequestV1) -> TwitterAPISessionJSONTask {
        media.uploadMediaAppend(request)
    }

    /// Appends media data in chunks to an initialized upload.
    /// - Parameters:
    ///   - request: The request parameters containing the media data.
    ///   - maxBytes: The maximum size of each chunk in bytes (default: 5MB).
    /// - Returns: An array of tasks that will return the media ID for each chunk.
    func uploadMediaAppendSplitChunks(
        _ request: UploadMediaAppendRequestV1,
        maxBytes: Int = 5_242_880
    ) -> [TwitterAPISessionSpecializedTask<String /* mediaID */>] {
        media.uploadMediaAppendSplitChunks(request, maxBytes: maxBytes)
    }

    /// Finalizes a media upload.
    /// - Parameter request: The request parameters for finalizing the upload.
    /// - Returns: A JSON task that will return the finalization response.
    func uploadMediaFinalize(_ request: UploadMediaFinalizeRequestV1) -> TwitterAPISessionJSONTask {
        media.uploadMediaFinalize(request)
    }

    /// Uploads media in a single operation.
    /// - Parameters:
    ///   - parameters: The parameters for the media upload.
    ///   - completionHandler: A closure to be called with the upload response.
    func uploadMedia(
        _ parameters: UploadMediaRequestParameters,
        completionHandler: @escaping (TwitterAPIResponse<String>) -> Void
    ) {
        media.uploadMedia(parameters, completionHandler: completionHandler)
    }

    /// Waits for media processing to complete with a specified initial wait time.
    /// - Parameters:
    ///   - mediaID: The ID of the media to wait for.
    ///   - initialWaitSec: The number of seconds to wait initially.
    ///   - completionHandler: A closure to be called with the processing status.
    func waitMediaProcessing(
        mediaID: String,
        initialWaitSec: Int,
        completionHandler: @escaping (TwitterAPIResponse<TwitterAPIClient.UploadMediaStatusResponse>) -> Void
    ) {
        media.waitMediaProcessing(
            mediaID: mediaID,
            initialWaitSec: initialWaitSec,
            completionHandler: completionHandler
        )
    }

    /// Waits for media processing to complete with default wait time.
    /// - Parameters:
    ///   - mediaID: The ID of the media to wait for.
    ///   - completionHandler: A closure to be called with the processing status.
    func waitMediaProcessing(
        mediaID: String,
        completionHandler: @escaping (TwitterAPIResponse<TwitterAPIClient.UploadMediaStatusResponse>) -> Void
    ) {
        media.waitMediaProcessing(mediaID: mediaID, completionHandler: completionHandler)
    }

    /// Creates metadata for uploaded media.
    /// - Parameter request: The request parameters containing the metadata.
    /// - Returns: A data task that will return the response.
    func createMediaMetadata(_ request: PostMediaMetadataCreateRequestV1) -> TwitterAPISessionDataTask {
        media.createMediaMetadata(request)
    }

    /// Creates subtitles for media.
    /// - Parameter request: The request parameters containing the subtitle data.
    /// - Returns: A data task that will return the response.
    func createSubtitle(_ request: PostMediaSubtitlesCreateRequestV1) -> TwitterAPISessionDataTask {
        media.createSubtitle(request)
    }

    /// Deletes subtitles from media.
    /// - Parameter request: The request parameters identifying the subtitles to delete.
    /// - Returns: A data task that will return the response.
    func deleteSubtitle(_ request: PostMediaSubtitlesDeleteRequestV1) -> TwitterAPISessionDataTask {
        media.deleteSubtitle(request)
    }

    // MARK: - RetweetAPIv1

    /// Creates a retweet of a tweet.
    /// - Parameter request: The request parameters containing the tweet to retweet.
    /// - Returns: A JSON task that will return the retweet.
    func postRetweet(_ request: PostRetweetRequestV1) -> TwitterAPISessionJSONTask {
        retweet.postRetweet(request)
    }

    /// Removes a retweet of a tweet.
    /// - Parameter request: The request parameters containing the retweet to remove.
    /// - Returns: A JSON task that will return the response.
    func postUnRetweet(_ request: PostUnRetweetRequestV1) -> TwitterAPISessionJSONTask {
        retweet.postUnRetweet(request)
    }

    /// Retrieves retweets of a tweet.
    /// - Parameter request: The request parameters for retrieving retweets.
    /// - Returns: A JSON task that will return the list of retweets.
    func getRetweets(_ request: GetRetweetsRequestV1) -> TwitterAPISessionJSONTask {
        retweet.getRetweets(request)
    }

    /// Retrieves tweets of the authenticated user that have been retweeted.
    /// - Parameter request: The request parameters for retrieving retweeted tweets.
    /// - Returns: A JSON task that will return the list of tweets.
    func getRetweetsOfMe(_ request: GetRetweetsOfMeRequestV1) -> TwitterAPISessionJSONTask {
        retweet.getRetweetsOfMe(request)
    }

    /// Retrieves users who have retweeted a tweet.
    /// - Parameter request: The request parameters for retrieving retweeters.
    /// - Returns: A JSON task that will return the list of users.
    func getRetweeters(_ request: GetRetweetersRequestV1) -> TwitterAPISessionJSONTask {
        retweet.getRetweeters(request)
    }

    // MARK: - SearchAPIv1

    /// Searches for tweets matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the matching tweets.
    func searchTweets(_ request: GetSearchTweetsRequestV1) -> TwitterAPISessionJSONTask {
        search.searchTweets(request)
    }

    /// Retrieves the authenticated user's saved searches.
    /// - Parameter request: The request parameters for retrieving saved searches.
    /// - Returns: A JSON task that will return the list of saved searches.
    func getSavedSearches(_ request: GetSavedSearchesListRequestV1) -> TwitterAPISessionJSONTask {
        search.getSavedSearches(request)
    }

    /// Creates a new saved search for the authenticated user.
    /// - Parameter request: The request parameters containing the search to save.
    /// - Returns: A JSON task that will return the saved search.
    func postCreateSavedSearch(_ request: PostSavedSearchesCreateRequestV1) -> TwitterAPISessionJSONTask {
        search.postCreateSavedSearch(request)
    }

    /// Deletes a saved search belonging to the authenticated user.
    /// - Parameter request: The request parameters containing the search to delete.
    /// - Returns: A JSON task that will return the response.
    func postDestroySavedSearch(_ request: PostSavedSearchesCreateRequestV1) -> TwitterAPISessionJSONTask {
        search.postDestroySavedSearch(request)
    }

    // MARK: - TimelineAPIv1

    /// Retrieves the authenticated user's home timeline.
    /// - Parameter request: The request parameters for retrieving the timeline.
    /// - Returns: A JSON task that will return the timeline tweets.
    func getHomeTimeline(_ request: GetStatusesHomeTimelineRequestV1) -> TwitterAPISessionJSONTask {
        timeline.getHomeTimeline(request)
    }

    /// Retrieves tweets mentioning the authenticated user.
    /// - Parameter request: The request parameters for retrieving mentions.
    /// - Returns: A JSON task that will return the mentions.
    func getMentionsTimeline(_ request: GetStatusesMentionsTimelineRequestV1) -> TwitterAPISessionJSONTask {
        timeline.getMentionsTimeline(request)
    }

    /// Retrieves a user's timeline.
    /// - Parameter request: The request parameters for retrieving the user timeline.
    /// - Returns: A JSON task that will return the timeline tweets.
    func getUserTimeline(_ request: GetStatusesUserTimelineRequestV1) -> TwitterAPISessionJSONTask {
        timeline.getUserTimeline(request)
    }

    // MARK: - TrendAPIv1

    /// Retrieves locations where trending topics are available.
    /// - Parameter request: The request parameters for retrieving trend locations.
    /// - Returns: A JSON task that will return the available locations.
    func getTrendsAvailable(_ request: GetTrendsAvailableRequestV1) -> TwitterAPISessionJSONTask {
        trend.getTrendsAvailable(request)
    }

    /// Retrieves locations closest to a specified location where trends are available.
    /// - Parameter request: The request parameters containing the location.
    /// - Returns: A JSON task that will return the closest trend locations.
    func getTrendsClosest(_ request: GetTrendsClosestRequestV1) -> TwitterAPISessionJSONTask {
        trend.getTrendsClosest(request)
    }

    /// Retrieves trending topics for a specific location.
    /// - Parameter request: The request parameters containing the location.
    /// - Returns: A JSON task that will return the trending topics.
    func getTrends(_ request: GetTrendsPlaceRequestV1) -> TwitterAPISessionJSONTask {
        trend.getTrends(request)
    }

    // MARK: - TweetAPIv1

    /// Posts a new tweet.
    /// - Parameter request: The request parameters containing the tweet content.
    /// - Returns: A JSON task that will return the posted tweet.
    func postUpdateStatus(_ request: PostStatusesUpdateRequestV1) -> TwitterAPISessionJSONTask {
        tweet.postUpdateStatus(request)
    }

    /// Deletes a tweet.
    /// - Parameter request: The request parameters containing the tweet to delete.
    /// - Returns: A JSON task that will return the response.
    func postDestroyStatus(_ request: PostStatusesDestroyRequestV1) -> TwitterAPISessionJSONTask {
        tweet.postDestroyStatus(request)
    }

    /// Retrieves a single tweet.
    /// - Parameter request: The request parameters containing the tweet ID.
    /// - Returns: A JSON task that will return the tweet.
    func getShowStatus(_ request: GetStatusesShowRequestV1) -> TwitterAPISessionJSONTask {
        tweet.getShowStatus(request)
    }

    /// Retrieves multiple tweets by their IDs.
    /// - Parameter request: The request parameters containing the tweet IDs.
    /// - Returns: A JSON task that will return the tweets.
    func getLookupStatuses(_ request: GetStatusesLookupRequestV1) -> TwitterAPISessionJSONTask {
        tweet.getLookupStatuses(request)
    }

    // MARK: - UserAPIv1

    /// Retrieves detailed information about multiple users.
    /// - Parameter request: The request parameters containing the user identifiers.
    /// - Returns: A JSON task that will return the user information.
    func getUsers(_ request: GetUsersLookupRequestV1) -> TwitterAPISessionJSONTask {
        user.getUsers(request)
    }

    /// Retrieves detailed information about a single user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the user information.
    func getUser(_ request: GetUsersShowRequestV1) -> TwitterAPISessionJSONTask {
        user.getUser(request)
    }

    /// Searches for users matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the matching users.
    func searchUser(_ request: GetUsersShowRequestV1) -> TwitterAPISessionJSONTask {
        user.searchUser(request)
    }

    /// Retrieves a user's profile banner.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the banner information.
    func getUserProfileBanner(_ request: GetUsersProfileBannerRequestV1) -> TwitterAPISessionJSONTask {
        user.getUserProfileBanner(request)
    }
}

public extension TwitterAPIv2: TwitterAPI {
    // MARK: - BlockAndMuteAPIv2

    /// Retrieves users blocked by the authenticated user.
    /// - Parameter request: The request parameters for retrieving blocked users.
    /// - Returns: A JSON task that will return the list of blocked users.
    func getBlockUsers(_ request: GetUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.getBlockUsers(request)
    }

    /// Blocks a user.
    /// - Parameter request: The request parameters containing the user to block.
    /// - Returns: A JSON task that will return the response.
    func blockUser(_ request: PostUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.blockUser(request)
    }

    /// Unblocks a user.
    /// - Parameter request: The request parameters containing the user to unblock.
    /// - Returns: A JSON task that will return the response.
    func unblockUser(_ request: DeleteUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.unblockUser(request)
    }

    /// Retrieves users muted by the authenticated user.
    /// - Parameter request: The request parameters for retrieving muted users.
    /// - Returns: A JSON task that will return the list of muted users.
    func getMuteUsers(_ request: GetUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.getMuteUsers(request)
    }

    /// Mutes a user.
    /// - Parameter request: The request parameters containing the user to mute.
    /// - Returns: A JSON task that will return the response.
    func muteUser(_ request: PostUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.muteUser(request)
    }

    /// Unmutes a user.
    /// - Parameter request: The request parameters containing the user to unmute.
    /// - Returns: A JSON task that will return the response.
    func unmuteUser(_ request: DeleteUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        blockAndMute.unmuteUser(request)
    }

    // MARK: - BookmarksAPIv2

    /// Retrieves the authenticated user's bookmarked tweets.
    /// - Parameter request: The request parameters for retrieving bookmarks.
    /// - Returns: A JSON task that will return the bookmarked tweets.
    func getBookmarks(_ request: GetUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        bookmarks.getBookmarks(request)
    }

    /// Bookmarks a tweet.
    /// - Parameter request: The request parameters containing the tweet to bookmark.
    /// - Returns: A JSON task that will return the response.
    func createBookmark(_ request: PostUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        bookmarks.createBookmark(request)
    }

    /// Removes a tweet from bookmarks.
    /// - Parameter request: The request parameters containing the tweet to remove.
    /// - Returns: A JSON task that will return the response.
    func deleteBookmark(_ request: DeleteUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        bookmarks.deleteBookmark(request)
    }

    // MARK: - ComplianceAPIv2

    /// Retrieves information about a specific compliance job.
    /// - Parameter request: The request parameters containing the job ID.
    /// - Returns: A JSON task that will return the job information.
    func getComplianceJob(_ request: GetComplianceJobRequestV2) -> TwitterAPISessionJSONTask {
        compliance.getComplianceJob(request)
    }

    /// Retrieves a list of compliance jobs.
    /// - Parameter request: The request parameters for retrieving compliance jobs.
    /// - Returns: A JSON task that will return the list of jobs.
    func getComplianceJobj(_ request: GetComplianceJobsRequestV2) -> TwitterAPISessionJSONTask {
        compliance.getComplianceJobj(request)
    }

    /// Creates a new compliance job.
    /// - Parameter request: The request parameters for creating the job.
    /// - Returns: A JSON task that will return the created job.
    func createComplianceJob(_ request: PostComplianceJobsRequestV2) -> TwitterAPISessionJSONTask {
        compliance.createComplianceJob(request)
    }

    // MARK: - FriendshipsAPIv2

    /// Retrieves users that a specified user is following.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of followed users.
    func getFollowing(_ request: GetUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        friendships.getFollowing(request)
    }

    /// Retrieves followers of a specified user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of followers.
    func getFollowers(_ request: GetUsersFollowersRequestV2) -> TwitterAPISessionJSONTask {
        friendships.getFollowers(request)
    }

    /// Follows a user.
    /// - Parameter request: The request parameters containing the user to follow.
    /// - Returns: A JSON task that will return the response.
    func follow(_ request: PostUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        friendships.follow(request)
    }

    /// Unfollows a user.
    /// - Parameter request: The request parameters containing the user to unfollow.
    /// - Returns: A JSON task that will return the response.
    func unfollow(_ request: DeleteUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        friendships.unfollow(request)
    }

    // MARK: - LikeAPIv2

    /// Retrieves users who have liked a tweet.
    /// - Parameter request: The request parameters containing the tweet ID.
    /// - Returns: A JSON task that will return the list of users.
    func getLikingUsers(_ request: GetTweetsLikingUsersRequestV2) -> TwitterAPISessionJSONTask {
        like.getLikingUsers(request)
    }

    /// Retrieves tweets liked by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list of liked tweets.
    func getLikedTweets(_ request: GetUsersLikedTweetsRequestV2) -> TwitterAPISessionJSONTask {
        like.getLikedTweets(request)
    }

    /// Likes a tweet.
    /// - Parameter request: The request parameters containing the tweet to like.
    /// - Returns: A JSON task that will return the response.
    func postLike(_ request: PostUsersLikesRequestV2) -> TwitterAPISessionJSONTask {
        like.postLike(request)
    }

    /// Unlikes a tweet.
    /// - Parameter request: The request parameters containing the tweet to unlike.
    /// - Returns: A JSON task that will return the response.
    func deleteLike(_ request: DeleteUsersLikesRequestV2) -> TwitterAPISessionJSONTask {
        like.deleteLike(request)
    }

    // MARK: - ListAPIv2

    /// Retrieves tweets from a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list tweets.
    func getListTweets(_ request: GetListsTweetsRequestV2) -> TwitterAPISessionJSONTask {
        list.getListTweets(request)
    }

    /// Retrieves information about a specific list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list information.
    func getList(_ request: GetListRequestV2) -> TwitterAPISessionJSONTask {
        list.getList(request)
    }

    /// Retrieves lists owned by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the owned lists.
    func getLists(_ request: GetUsersOwnedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.getLists(request)
    }

    /// Follows a list.
    /// - Parameter request: The request parameters containing the list to follow.
    /// - Returns: A JSON task that will return the response.
    func followList(_ request: PostUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.followList(request)
    }

    /// Unfollows a list.
    /// - Parameter request: The request parameters containing the list to unfollow.
    /// - Returns: A JSON task that will return the response.
    func unfollowList(_ request: DeleteUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.unfollowList(request)
    }

    /// Retrieves followers of a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list followers.
    func listFollowers(_ request: GetListsFollowersRequestV2) -> TwitterAPISessionJSONTask {
        list.listFollowers(request)
    }

    /// Retrieves lists followed by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the followed lists.
    func followedLists(_ request: GetUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.followedLists(request)
    }

    /// Adds a member to a list.
    /// - Parameter request: The request parameters containing the user and list.
    /// - Returns: A JSON task that will return the response.
    func addListMember(_ request: PostListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        list.addListMember(request)
    }

    /// Removes a member from a list.
    /// - Parameter request: The request parameters containing the user and list.
    /// - Returns: A JSON task that will return the response.
    func removeListMember(_ request: DeleteListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        list.removeListMember(request)
    }

    /// Retrieves lists that a user is a member of.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the list memberships.
    func getListMemberships(_ request: GetUsersListMembershipsRequestV2) -> TwitterAPISessionJSONTask {
        list.getListMemberships(request)
    }

    /// Retrieves members of a list.
    /// - Parameter request: The request parameters containing the list ID.
    /// - Returns: A JSON task that will return the list members.
    func getListMembers(_ request: GetListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        list.getListMembers(request)
    }

    /// Creates a new list.
    /// - Parameter request: The request parameters for creating the list.
    /// - Returns: A JSON task that will return the created list.
    func createList(_ request: PostListsRequestV2) -> TwitterAPISessionJSONTask {
        list.createList(request)
    }

    /// Updates a list's metadata.
    /// - Parameter request: The request parameters containing the updated information.
    /// - Returns: A JSON task that will return the updated list.
    func updateList(_ request: PutListRequestV2) -> TwitterAPISessionJSONTask {
        list.updateList(request)
    }

    /// Deletes a list.
    /// - Parameter request: The request parameters containing the list to delete.
    /// - Returns: A JSON task that will return the response.
    func deleteList(_ request: DeleteListRequestV2) -> TwitterAPISessionJSONTask {
        list.deleteList(request)
    }

    /// Retrieves a user's pinned lists.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the pinned lists.
    func pinnedList(_ request: GetUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.pinnedList(request)
    }

    /// Pins a list to the user's profile.
    /// - Parameter request: The request parameters containing the list to pin.
    /// - Returns: A JSON task that will return the response.
    func pinList(_ request: PostUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.pinList(request)
    }

    /// Unpins a list from the user's profile.
    /// - Parameter request: The request parameters containing the list to unpin.
    /// - Returns: A JSON task that will return the response.
    func unpinList(_ request: DeleteUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        list.unpinList(request)
    }

    // MARK: - RetweetAPIv2

    /// Retrieves users who have retweeted a tweet.
    /// - Parameter request: The request parameters containing the tweet ID.
    /// - Returns: A JSON task that will return the list of users.
    func getRetweetedBy(_ request: GetTweetsRetweetedByRequestV2) -> TwitterAPISessionJSONTask {
        retweet.getRetweetedBy(request)
    }

    /// Creates a retweet of a tweet.
    /// - Parameter request: The request parameters containing the tweet to retweet.
    /// - Returns: A JSON task that will return the response.
    func postRetweet(_ request: PostUsersRetweetsRequestV2) -> TwitterAPISessionJSONTask {
        retweet.postRetweet(request)
    }

    /// Removes a retweet of a tweet.
    /// - Parameter request: The request parameters containing the retweet to remove.
    /// - Returns: A JSON task that will return the response.
    func deleteRetweet(_ request: DeleteUsersRetweetsRequestV2) -> TwitterAPISessionJSONTask {
        retweet.deleteRetweet(request)
    }

    // MARK: - SearchAPIv2

    /// Searches for recent tweets matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the matching tweets.
    func searchTweetsRecent(_ request: GetTweetsSearchRecentRequestV2) -> TwitterAPISessionJSONTask {
        search.searchTweetsRecent(request)
    }

    /// Searches for all tweets matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the matching tweets.
    func searchTweetsAll(_ request: GetTweetsSearchAllRequestV2) -> TwitterAPISessionJSONTask {
        search.searchTweetsAll(request)
    }

    // MARK: - SpacesAPIv2

    /// Retrieves information about a specific space.
    /// - Parameter request: The request parameters containing the space ID.
    /// - Returns: A JSON task that will return the space information.
    func getSpace(_ request: GetSpaceRequestV2) -> TwitterAPISessionJSONTask {
        spaces.getSpace(request)
    }

    /// Retrieves information about multiple spaces.
    /// - Parameter request: The request parameters containing the space IDs.
    /// - Returns: A JSON task that will return the spaces information.
    func getSpaces(_ request: GetSpacesRequestV2) -> TwitterAPISessionJSONTask {
        spaces.getSpaces(request)
    }

    /// Retrieves spaces created by specified users.
    /// - Parameter request: The request parameters containing the creator IDs.
    /// - Returns: A JSON task that will return the spaces information.
    func getSpacesByCreators(_ request: GetSpacesByCreatorIDsRequestV2) -> TwitterAPISessionJSONTask {
        spaces.getSpacesByCreators(request)
    }

    /// Retrieves users who have purchased tickets to a space.
    /// - Parameter request: The request parameters containing the space ID.
    /// - Returns: A JSON task that will return the list of buyers.
    func getSpacesBuyers(_ request: GetSpacesBuyersRequestV2) -> TwitterAPISessionJSONTask {
        spaces.getSpacesBuyers(request)
    }

    /// Retrieves tweets shared in a space.
    /// - Parameter request: The request parameters containing the space ID.
    /// - Returns: A JSON task that will return the tweets.
    func getSPacesTweets(_ request: GetSpacesTweetsRequestV2) -> TwitterAPISessionJSONTask {
        spaces.getSPacesTweets(request)
    }

    /// Searches for spaces matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the matching spaces.
    func searchSpaces(_ request: GetSpacesSearchRequestV2) -> TwitterAPISessionJSONTask {
        spaces.searchSpaces(request)
    }

    // MARK: - StreamAPIv2

    /// Connects to the sample stream of tweets.
    /// - Parameter request: The request parameters for the sample stream.
    /// - Returns: A stream task that will provide tweets in real-time.
    func sampleStream(_ request: GetTweetsSampleStreamRequestV2) -> TwitterAPISessionStreamTask {
        stream.sampleStream(request)
    }

    /// Retrieves rules for filtered stream.
    /// - Parameter request: The request parameters for retrieving stream rules.
    /// - Returns: A JSON task that will return the stream rules.
    func getSearchStreamRules(_ request: GetTweetsSearchStreamRulesRequestV2) -> TwitterAPISessionJSONTask {
        stream.getSearchStreamRules(request)
    }

    /// Updates rules for filtered stream.
    /// - Parameter request: The request parameters containing the rule updates.
    /// - Returns: A JSON task that will return the updated rules.
    func postSearchStreamRules(_ request: PostTweetsSearchStreamRulesRequestV2) -> TwitterAPISessionJSONTask {
        stream.postSearchStreamRules(request)
    }

    /// Connects to the filtered stream of tweets.
    /// - Parameter request: The request parameters for the filtered stream.
    /// - Returns: A stream task that will provide filtered tweets in real-time.
    func searchStream(_ request: GetTweetsSearchStreamRequestV2) -> TwitterAPISessionStreamTask {
        stream.searchStream(request)
    }

    // MARK: - TimelineAPIv2

    /// Retrieves tweets posted by a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the user's tweets.
    func getUserTweets(_ request: GetUsersTweetsRequestV2) -> TwitterAPISessionJSONTask {
        timeline.getUserTweets(request)
    }

    /// Retrieves tweets mentioning a user.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the mentions.
    func getUserMensions(_ request: GetUsersMentionsRequestV2) -> TwitterAPISessionJSONTask {
        timeline.getUserMensions(request)
    }

    /// Retrieves a user's reverse chronological timeline.
    /// - Parameter request: The request parameters containing the user identifier.
    /// - Returns: A JSON task that will return the timeline tweets.
    func getUserReverseChronological(_ request: GetUsersTimelinesReverseChronologicalRequestV2)
        -> TwitterAPISessionJSONTask
    {
        timeline.getUserReverseChronological(request)
    }

    // MARK: - TweetAPIv2

    /// Retrieves multiple tweets by their IDs.
    /// - Parameter request: The request parameters containing the tweet IDs.
    /// - Returns: A JSON task that will return the tweets.
    func getTweets(_ request: GetTweetsRequestV2) -> TwitterAPISessionJSONTask {
        tweet.getTweets(request)
    }

    /// Retrieves a single tweet.
    /// - Parameter request: The request parameters containing the tweet ID.
    /// - Returns: A JSON task that will return the tweet.
    func getTweet(_ request: GetTweetRequestV2) -> TwitterAPISessionJSONTask {
        tweet.getTweet(request)
    }

    /// Retrieves tweets quoting a tweet.
    /// - Parameter request: The request parameters containing the tweet ID.
    /// - Returns: A JSON task that will return the quote tweets.
    func getQuoteTweets(_ request: GetTweetsQuoteTweetsRequestV2) -> TwitterAPISessionJSONTask {
        tweet.getQuoteTweets(request)
    }

    /// Deletes a tweet.
    /// - Parameter request: The request parameters containing the tweet to delete.
    /// - Returns: A JSON task that will return the response.
    func deleteTweet(_ request: DeleteTweetRequestV2) -> TwitterAPISessionJSONTask {
        tweet.deleteTweet(request)
    }

    /// Posts a new tweet.
    /// - Parameter request: The request parameters containing the tweet content.
    /// - Returns: A JSON task that will return the posted tweet.
    func postTweet(_ request: PostTweetsRequestV2) -> TwitterAPISessionJSONTask {
        tweet.postTweet(request)
    }

    /// Hides a reply to a tweet.
    /// - Parameter request: The request parameters containing the reply to hide.
    /// - Returns: A JSON task that will return the response.
    func hideReply(_ request: PutTweetsHiddenRequestV2) -> TwitterAPISessionJSONTask {
        tweet.hideReply(request)
    }

    // MARK: - TweetCountAPIv2

    /// Retrieves count of recent tweets matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the tweet count.
    func getTweetCountRecent(_ request: GetTweetsCountsRecentRequestV2) -> TwitterAPISessionJSONTask {
        tweetCount.getTweetCountRecent(request)
    }

    /// Retrieves count of all tweets matching a query.
    /// - Parameter request: The request parameters containing the search query.
    /// - Returns: A JSON task that will return the tweet count.
    func getTweetCountAll(_ request: GetTweetsCountsAllRequestV2) -> TwitterAPISessionJSONTask {
        tweetCount.getTweetCountAll(request)
    }

    // MARK: - UserAPIv2

    /// Retrieves information about a specific user.
    /// - Parameter request: The request parameters containing the user ID.
    /// - Returns: A JSON task that will return the user information.
    func getUser(_ request: GetUserRequestV2) -> TwitterAPISessionJSONTask {
        user.getUser(request)
    }

    /// Retrieves information about multiple users.
    /// - Parameter request: The request parameters containing the user IDs.
    /// - Returns: A JSON task that will return the users information.
    func getUsers(_ request: GetUsersRequestV2) -> TwitterAPISessionJSONTask {
        user.getUsers(request)
    }

    /// Retrieves a user by their username.
    /// - Parameter request: The request parameters containing the username.
    /// - Returns: A JSON task that will return the user information.
    func getUserByUsername(_ request: GetUsersByUsernameRequestV2) -> TwitterAPISessionJSONTask {
        user.getUserByUsername(request)
    }

    /// Retrieves multiple users by their usernames.
    /// - Parameter request: The request parameters containing the usernames.
    /// - Returns: A JSON task that will return the users information.
    func getUsersByUsernames(_ request: GetUsersByRequestV2) -> TwitterAPISessionJSONTask {
        user.getUsersByUsernames(request)
    }

    /// Retrieves information about the authenticated user.
    /// - Parameter request: The request parameters for retrieving user information.
    /// - Returns: A JSON task that will return the user information.
    func getMe(_ request: GetUsersMeRequestV2) -> TwitterAPISessionJSONTask {
        user.getMe(request)
    }

    // MARK: - DirectMessageAPIv2

    /// Retrieves direct message events.
    /// - Parameter request: The request parameters for retrieving DM events.
    /// - Returns: A JSON task that will return the DM events.
    func getDmEvents(_ request: GetDmEventsRequestV2) -> TwitterAPISessionJSONTask {
        dm.getDmEvents(request)
    }

    /// Retrieves direct message events with a specific participant.
    /// - Parameter request: The request parameters containing the participant ID.
    /// - Returns: A JSON task that will return the DM events.
    func getDmEventsWithParticipantId(_ request: GetDmConversationsWithParticipantIdDmEventsRequestV2)
        -> TwitterAPISessionJSONTask
    {
        dm.getDmEventsWithParticipantId(request)
    }

    /// Retrieves direct message events from a specific conversation.
    /// - Parameter request: The request parameters containing the conversation ID.
    /// - Returns: A JSON task that will return the DM events.
    func getDmEventsByConversationsId(_ request: GetDmConversationsIdDmEventsRequestV2) -> TwitterAPISessionJSONTask {
        dm.getDmEventsByConversationsId(request)
    }

    /// Posts a new direct message conversation.
    /// - Parameter request: The request parameters for creating a new conversation.
    /// - Returns: A JSON task that will return the created conversation.
    func postDmConversationById(_ request: PostDmConversationByIdRequestV2) -> TwitterAPISessionJSONTask {
        dm.postDmConversationById(request)
    }

    /// Posts a new direct message conversation with a specific user.
    /// - Parameter request: The request parameters containing the user and message.
    /// - Returns: A JSON task that will return the created conversation.
    func postDmConversationWithUser(_ request: PostDmConversationWithUserRequestV2) -> TwitterAPISessionJSONTask {
        dm.postDmConversationWithUser(request)
    }

    /// Posts a new direct message conversation with multiple participants.
    /// - Parameter request: The request parameters containing the participants and message.
    /// - Returns: A JSON task that will return the created conversation.
    func postDmConversation(_ request: PostDmConversationRequestV2) -> TwitterAPISessionJSONTask {
        dm.postDmConversation(request)
    }
}
