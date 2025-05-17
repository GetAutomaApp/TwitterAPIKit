// TwitterAPI+Flat.generated.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

// swift-format-ignore-file
import Foundation

public extension TwitterAuthAPI {
    // MARK: - OAuth10aAPI

    func postOAuthRequestTokenData(_ request: PostOAuthRequestTokenRequestV1) -> TwitterAPISessionDataTask {
        return oauth10a.postOAuthRequestTokenData(request)
    }

    func postOAuthRequestToken(_ request: PostOAuthRequestTokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuthTokenV1>
    {
        return oauth10a.postOAuthRequestToken(request)
    }

    func makeOAuthAuthorizeURL(_ request: GetOAuthAuthorizeRequestV1) -> URL? {
        return oauth10a.makeOAuthAuthorizeURL(request)
    }

    func makeOAuthAuthenticateURL(_ request: GetOAuthAuthenticateRequestV1) -> URL? {
        return oauth10a.makeOAuthAuthenticateURL(request)
    }

    func postOAuthAccessTokenData(_ request: PostOAuthAccessTokenRequestV1) -> TwitterAPISessionDataTask {
        return oauth10a.postOAuthAccessTokenData(request)
    }

    func postOAuthAccessToken(_ request: PostOAuthAccessTokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuthAccessTokenV1>
    {
        return oauth10a.postOAuthAccessToken(request)
    }

    func postInvalidateAccessToken(_ request: PostOAuthInvalidateTokenRequestV1) -> TwitterAPISessionJSONTask {
        return oauth10a.postInvalidateAccessToken(request)
    }

    // MARK: - OAuth20API

    func postOAuth2BearerTokenData(_ request: PostOAuth2TokenRequestV1) -> TwitterAPISessionDataTask {
        return oauth20.postOAuth2BearerTokenData(request)
    }

    func postOAuth2BearerToken(_ request: PostOAuth2TokenRequestV1)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2BearerToken>
    {
        return oauth20.postOAuth2BearerToken(request)
    }

    func postInvalidateOAuth2BearerToken(_ request: PostOAuth2InvalidateTokenRequestV1) -> TwitterAPISessionJSONTask {
        return oauth20.postInvalidateOAuth2BearerToken(request)
    }

    func makeOAuth2AuthorizeURL(_ request: GetOAuth2AuthorizeRequestV1) -> URL? {
        return oauth20.makeOAuth2AuthorizeURL(request)
    }

    func postOAuth2AccessTokenData(_ request: PostOAuth2AccessTokenRequestV2) -> TwitterAPISessionDataTask {
        return oauth20.postOAuth2AccessTokenData(request)
    }

    func postOAuth2AccessToken(_ request: PostOAuth2AccessTokenRequestV2)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2AccessToken>
    {
        return oauth20.postOAuth2AccessToken(request)
    }

    func postOAuth2RefreshTokenData(_ request: PostOAuth2RefreshTokenRequestV2) -> TwitterAPISessionDataTask {
        return oauth20.postOAuth2RefreshTokenData(request)
    }

    func postOAuth2RefreshToken(_ request: PostOAuth2RefreshTokenRequestV2)
        -> TwitterAPISessionSpecializedTask<TwitterOAuth2AccessToken>
    {
        return oauth20.postOAuth2RefreshToken(request)
    }

    func postOAuth2RevokeToken(_ request: PostOAuth2RevokeTokenRequestV2) -> TwitterAPISessionDataTask {
        return oauth20.postOAuth2RevokeToken(request)
    }
}

public extension TwitterAPIv1 {
    // MARK: - AccountAPIv1

    func getAccountSetting(_ request: GetAccountSettingsRequestV1) -> TwitterAPISessionJSONTask {
        return account.getAccountSetting(request)
    }

    func getAccountVerify(_ request: GetAccountVerifyCredentialsRequestV1) -> TwitterAPISessionJSONTask {
        return account.getAccountVerify(request)
    }

    func postRemoveProfileBanner(_ request: PostAccountRemoveProfileBannerRequestV1) -> TwitterAPISessionJSONTask {
        return account.postRemoveProfileBanner(request)
    }

    func postAccountSettings(_ request: PostAccountSettingsRequestV1) -> TwitterAPISessionJSONTask {
        return account.postAccountSettings(request)
    }

    func postAccountProfile(_ request: PostAccountUpdateProfileRequestV1) -> TwitterAPISessionJSONTask {
        return account.postAccountProfile(request)
    }

    func postProfileBanner(_ request: PostAccountUpdateProfileBannerRequestV1) -> TwitterAPISessionDataTask {
        return account.postProfileBanner(request)
    }

    func postProfileImage(_ request: PostAccountUpdateProfileImageRequestV1) -> TwitterAPISessionJSONTask {
        return account.postProfileImage(request)
    }

    // MARK: - ApplicationAPIv1

    func getRateLimit(_ request: GetApplicationRateLimitStatusRequestV1) -> TwitterAPISessionJSONTask {
        return application.getRateLimit(request)
    }

    // MARK: - BlockAndMuteAPIv1

    func getBlockIDs(_ request: GetBlocksIDsRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.getBlockIDs(request)
    }

    func getBlockUsers(_ request: GetBlocksListRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.getBlockUsers(request)
    }

    func getMuteIDs(_ request: GetMutesUsersIDsRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.getMuteIDs(request)
    }

    func getMuteUsers(_ request: GetMutesUsersListRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.getMuteUsers(request)
    }

    func postBlockUser(_ request: PostBlocksCreateRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.postBlockUser(request)
    }

    func postUnblockUser(_ request: PostBlocksDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.postUnblockUser(request)
    }

    func postMuteUser(_ request: PostMutesUsersCreateRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.postMuteUser(request)
    }

    func postUnmuteUser(_ request: PostMutesUsersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.postUnmuteUser(request)
    }

    func postReportSpam(_ request: PostUsersReportSpamRequestV1) -> TwitterAPISessionJSONTask {
        return blockAndMute.postReportSpam(request)
    }

    // MARK: - CollectionAPIv1

    func getCollectionEntries(_ request: GetCollectionsEntriesRequestV1) -> TwitterAPISessionJSONTask {
        return collection.getCollectionEntries(request)
    }

    func getCollections(_ request: GetCollectionsListRequestV1) -> TwitterAPISessionJSONTask {
        return collection.getCollections(request)
    }

    func getCollection(_ request: GetCollectionsShowRequestV1) -> TwitterAPISessionJSONTask {
        return collection.getCollection(request)
    }

    func postCreateCollection(_ request: PostCollectionsCreateRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCreateCollection(request)
    }

    func postDestroyCollection(_ request: PostCollectionsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postDestroyCollection(request)
    }

    func postCollectionAddEntry(_ request: PostCollectionsEntriesAddRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCollectionAddEntry(request)
    }

    func postCollectionCurate(_ request: PostCollectionsEntriesCurateRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCollectionCurate(request)
    }

    func postCollectionMoveEntry(_ request: PostCollectionsEntriesMoveRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCollectionMoveEntry(request)
    }

    func postCollectionRemoveEntry(_ request: PostCollectionsEntriesRemoveRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCollectionRemoveEntry(request)
    }

    func postCollectionUpdate(_ request: PostCollectionsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        return collection.postCollectionUpdate(request)
    }

    // MARK: - DirectMessageAPIv1

    func postDirectMessage(_ request: PostDirectMessageRequestV1) -> TwitterAPISessionJSONTask {
        return directMessage.postDirectMessage(request)
    }

    func deleteDirectMessage(_ request: DeleteDirectMessageRequestV1) -> TwitterAPISessionDataTask {
        return directMessage.deleteDirectMessage(request)
    }

    func getDirectMessage(_ request: GetDirectMessageRequestV1) -> TwitterAPISessionJSONTask {
        return directMessage.getDirectMessage(request)
    }

    func getDirectMessageList(_ request: GetDirectMessageListRequestV1) -> TwitterAPISessionJSONTask {
        return directMessage.getDirectMessageList(request)
    }

    func postDirectMessageMarkRead(_ request: PostDirectMessagesMarkReadRequestV1) -> TwitterAPISessionDataTask {
        return directMessage.postDirectMessageMarkRead(request)
    }

    func postDirectMessageTypingIndicator(_ request: PostDirectMessagesIndicateTypingRequestV1)
        -> TwitterAPISessionDataTask
    {
        return directMessage.postDirectMessageTypingIndicator(request)
    }

    // MARK: - FavoriteAPIv1

    func postFavorite(_ request: PostFavoriteRequestV1) -> TwitterAPISessionJSONTask {
        return favorite.postFavorite(request)
    }

    func postUnFavorite(_ request: PostUnFavoriteRequestV1) -> TwitterAPISessionJSONTask {
        return favorite.postUnFavorite(request)
    }

    func getFavorites(_ request: GetFavoritesRequestV1) -> TwitterAPISessionJSONTask {
        return favorite.getFavorites(request)
    }

    // MARK: - FriendshipsAPIv1

    func getFollowerIDs(_ request: GetFollowersIDsRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFollowerIDs(request)
    }

    func getFollowers(_ request: GetFollowersListRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFollowers(request)
    }

    func getFriendIDs(_ request: GetFriendsIDsRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendIDs(request)
    }

    func getFriends(_ request: GetFriendsListRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriends(request)
    }

    func getFriendshipsIncoming(_ request: GetFriendshipsIncomingRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendshipsIncoming(request)
    }

    func getFriendshipsLookup(_ request: GetFriendshipsLookupRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendshipsLookup(request)
    }

    func getFriendshipsNoRetweetsIDs(_ request: GetFriendshipsNoRetweetsIDsRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendshipsNoRetweetsIDs(request)
    }

    func getFriendshipsOutgoing(_ request: GetFriendshipsOutgoingRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendshipsOutgoing(request)
    }

    func getFriendships(_ request: GetFriendshipsShowRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.getFriendships(request)
    }

    func postFollowUser(_ request: PostFriendshipsCreateRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.postFollowUser(request)
    }

    func postUnfollowUser(_ request: PostFriendshipsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.postUnfollowUser(request)
    }

    func postFriendshipsUpdate(_ request: PostFriendshipsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        return friendships.postFriendshipsUpdate(request)
    }

    // MARK: - GeoAPIv1

    func getReverseGeocode(_ request: GetGeoReverseGeocodeRequestV1) -> TwitterAPISessionJSONTask {
        return geo.getReverseGeocode(request)
    }

    func getGeoPlace(_ request: GetGeoPlaceIDRequestV1) -> TwitterAPISessionJSONTask {
        return geo.getGeoPlace(request)
    }

    func searchGeo(_ request: GetGeoSearchRequestV1) -> TwitterAPISessionJSONTask {
        return geo.searchGeo(request)
    }

    // MARK: - HelpAPIv1

    func getSupportedLanguages(_ request: GetHelpLanguagesRequestV1) -> TwitterAPISessionJSONTask {
        return help.getSupportedLanguages(request)
    }

    // MARK: - ListAPIv1

    func getLists(_ request: GetListsListRequestV1) -> TwitterAPISessionJSONTask {
        return list.getLists(request)
    }

    func getListMembers(_ request: GetListsMembersRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListMembers(request)
    }

    func getListMember(_ request: GetListsMembersShowRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListMember(request)
    }

    func getListMemberships(_ request: GetListsMembershipsRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListMemberships(request)
    }

    func getListOwnerships(_ request: GetListsOwnershipsRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListOwnerships(request)
    }

    func getList(_ request: GetListsShowRequestV1) -> TwitterAPISessionJSONTask {
        return list.getList(request)
    }

    func getListStatuses(_ request: GetListsStatusesRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListStatuses(request)
    }

    func getListSubscribers(_ request: GetListsSubscribersRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListSubscribers(request)
    }

    func getListSubscriber(_ request: GetListsSubscribersShowRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListSubscriber(request)
    }

    func getListSubscriptions(_ request: GetListsSubscriptionsRequestV1) -> TwitterAPISessionJSONTask {
        return list.getListSubscriptions(request)
    }

    func postCreateList(_ request: PostListsCreateRequestV1) -> TwitterAPISessionJSONTask {
        return list.postCreateList(request)
    }

    func postDestroyList(_ request: PostListsDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return list.postDestroyList(request)
    }

    func postAddListMember(_ request: PostListsMembersCreateRequestV1) -> TwitterAPISessionJSONTask {
        return list.postAddListMember(request)
    }

    func postAddListMembers(_ request: PostListsMembersCreateAllRequestV1) -> TwitterAPISessionJSONTask {
        return list.postAddListMembers(request)
    }

    func postRemoveListMember(_ request: PostListsMembersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return list.postRemoveListMember(request)
    }

    func postRemoveListMembers(_ request: PostListsMembersDestroyAllRequestV1) -> TwitterAPISessionJSONTask {
        return list.postRemoveListMembers(request)
    }

    func postSubscribeList(_ request: PostListsSubscribersCreateRequestV1) -> TwitterAPISessionJSONTask {
        return list.postSubscribeList(request)
    }

    func postUnsubscribeList(_ request: PostListsSubscribersDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return list.postUnsubscribeList(request)
    }

    func postUpdateList(_ request: PostListsUpdateRequestV1) -> TwitterAPISessionJSONTask {
        return list.postUpdateList(request)
    }

    // MARK: - MediaAPIv1

    func getUploadMediaStatus(_ request: GetUploadMediaStatusRequestV1) -> TwitterAPISessionJSONTask {
        return media.getUploadMediaStatus(request)
    }

    func uploadMediaInit(_ request: UploadMediaInitRequestV1) -> TwitterAPISessionJSONTask {
        return media.uploadMediaInit(request)
    }

    func uploadMediaAppend(_ request: UploadMediaAppendRequestV1) -> TwitterAPISessionJSONTask {
        return media.uploadMediaAppend(request)
    }

    func uploadMediaAppendSplitChunks(_ request: UploadMediaAppendRequestV1,
                                      maxBytes: Int = 5_242_880) -> [TwitterAPISessionSpecializedTask<
        String /* mediaID */
    >] {
        return media.uploadMediaAppendSplitChunks(request, maxBytes: maxBytes)
    }

    func uploadMediaFinalize(_ request: UploadMediaFinalizeRequestV1) -> TwitterAPISessionJSONTask {
        return media.uploadMediaFinalize(request)
    }

    func uploadMedia(
        _ parameters: UploadMediaRequestParameters,
        completionHandler: @escaping (TwitterAPIResponse<String>) -> Void
    ) {
        media.uploadMedia(parameters, completionHandler: completionHandler)
    }

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

    func waitMediaProcessing(
        mediaID: String,
        completionHandler: @escaping (TwitterAPIResponse<TwitterAPIClient.UploadMediaStatusResponse>) -> Void
    ) {
        media.waitMediaProcessing(mediaID: mediaID, completionHandler: completionHandler)
    }

    func createMediaMetadata(_ request: PostMediaMetadataCreateRequestV1) -> TwitterAPISessionDataTask {
        return media.createMediaMetadata(request)
    }

    func createSubtitle(_ request: PostMediaSubtitlesCreateRequestV1) -> TwitterAPISessionDataTask {
        return media.createSubtitle(request)
    }

    func deleteSubtitle(_ request: PostMediaSubtitlesDeleteRequestV1) -> TwitterAPISessionDataTask {
        return media.deleteSubtitle(request)
    }

    // MARK: - RetweetAPIv1

    func postRetweet(_ request: PostRetweetRequestV1) -> TwitterAPISessionJSONTask {
        return retweet.postRetweet(request)
    }

    func postUnRetweet(_ request: PostUnRetweetRequestV1) -> TwitterAPISessionJSONTask {
        return retweet.postUnRetweet(request)
    }

    func getRetweets(_ request: GetRetweetsRequestV1) -> TwitterAPISessionJSONTask {
        return retweet.getRetweets(request)
    }

    func getRetweetsOfMe(_ request: GetRetweetsOfMeRequestV1) -> TwitterAPISessionJSONTask {
        return retweet.getRetweetsOfMe(request)
    }

    func getRetweeters(_ request: GetRetweetersRequestV1) -> TwitterAPISessionJSONTask {
        return retweet.getRetweeters(request)
    }

    // MARK: - SearchAPIv1

    func searchTweets(_ request: GetSearchTweetsRequestV1) -> TwitterAPISessionJSONTask {
        return search.searchTweets(request)
    }

    func getSavedSearches(_ request: GetSavedSearchesListRequestV1) -> TwitterAPISessionJSONTask {
        return search.getSavedSearches(request)
    }

    func postCreateSavedSearch(_ request: PostSavedSearchesCreateRequestV1) -> TwitterAPISessionJSONTask {
        return search.postCreateSavedSearch(request)
    }

    func postDestroySavedSearch(_ request: PostSavedSearchesCreateRequestV1) -> TwitterAPISessionJSONTask {
        return search.postDestroySavedSearch(request)
    }

    // MARK: - TimelineAPIv1

    func getHomeTimeline(_ request: GetStatusesHomeTimelineRequestV1) -> TwitterAPISessionJSONTask {
        return timeline.getHomeTimeline(request)
    }

    func getMentionsTimeline(_ request: GetStatusesMentionsTimelineRequestV1) -> TwitterAPISessionJSONTask {
        return timeline.getMentionsTimeline(request)
    }

    func getUserTimeline(_ request: GetStatusesUserTimelineRequestV1) -> TwitterAPISessionJSONTask {
        return timeline.getUserTimeline(request)
    }

    // MARK: - TrendAPIv1

    func getTrendsAvailable(_ request: GetTrendsAvailableRequestV1) -> TwitterAPISessionJSONTask {
        return trend.getTrendsAvailable(request)
    }

    func getTrendsClosest(_ request: GetTrendsClosestRequestV1) -> TwitterAPISessionJSONTask {
        return trend.getTrendsClosest(request)
    }

    func getTrends(_ request: GetTrendsPlaceRequestV1) -> TwitterAPISessionJSONTask {
        return trend.getTrends(request)
    }

    // MARK: - TweetAPIv1

    func postUpdateStatus(_ request: PostStatusesUpdateRequestV1) -> TwitterAPISessionJSONTask {
        return tweet.postUpdateStatus(request)
    }

    func postDestroyStatus(_ request: PostStatusesDestroyRequestV1) -> TwitterAPISessionJSONTask {
        return tweet.postDestroyStatus(request)
    }

    func getShowStatus(_ request: GetStatusesShowRequestV1) -> TwitterAPISessionJSONTask {
        return tweet.getShowStatus(request)
    }

    func getLookupStatuses(_ request: GetStatusesLookupRequestV1) -> TwitterAPISessionJSONTask {
        return tweet.getLookupStatuses(request)
    }

    // MARK: - UserAPIv1

    func getUsers(_ request: GetUsersLookupRequestV1) -> TwitterAPISessionJSONTask {
        return user.getUsers(request)
    }

    func getUser(_ request: GetUsersShowRequestV1) -> TwitterAPISessionJSONTask {
        return user.getUser(request)
    }

    func searchUser(_ request: GetUsersShowRequestV1) -> TwitterAPISessionJSONTask {
        return user.searchUser(request)
    }

    func getUserProfileBanner(_ request: GetUsersProfileBannerRequestV1) -> TwitterAPISessionJSONTask {
        return user.getUserProfileBanner(request)
    }
}

public extension TwitterAPIv2 {
    // MARK: - BlockAndMuteAPIv2

    func getBlockUsers(_ request: GetUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.getBlockUsers(request)
    }

    func blockUser(_ request: PostUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.blockUser(request)
    }

    func unblockUser(_ request: DeleteUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.unblockUser(request)
    }

    func getMuteUsers(_ request: GetUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.getMuteUsers(request)
    }

    func muteUser(_ request: PostUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.muteUser(request)
    }

    func unmuteUser(_ request: DeleteUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return blockAndMute.unmuteUser(request)
    }

    // MARK: - BookmarksAPIv2

    func getBookmarks(_ request: GetUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        return bookmarks.getBookmarks(request)
    }

    func createBookmark(_ request: PostUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        return bookmarks.createBookmark(request)
    }

    func deleteBookmark(_ request: DeleteUsersBookmarksRequestV2) -> TwitterAPISessionJSONTask {
        return bookmarks.deleteBookmark(request)
    }

    // MARK: - ComplianceAPIv2

    func getComplianceJob(_ request: GetComplianceJobRequestV2) -> TwitterAPISessionJSONTask {
        return compliance.getComplianceJob(request)
    }

    func getComplianceJobj(_ request: GetComplianceJobsRequestV2) -> TwitterAPISessionJSONTask {
        return compliance.getComplianceJobj(request)
    }

    func createComplianceJob(_ request: PostComplianceJobsRequestV2) -> TwitterAPISessionJSONTask {
        return compliance.createComplianceJob(request)
    }

    // MARK: - FriendshipsAPIv2

    func getFollowing(_ request: GetUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return friendships.getFollowing(request)
    }

    func getFollowers(_ request: GetUsersFollowersRequestV2) -> TwitterAPISessionJSONTask {
        return friendships.getFollowers(request)
    }

    func follow(_ request: PostUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return friendships.follow(request)
    }

    func unfollow(_ request: DeleteUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return friendships.unfollow(request)
    }

    // MARK: - LikeAPIv2

    func getLikingUsers(_ request: GetTweetsLikingUsersRequestV2) -> TwitterAPISessionJSONTask {
        return like.getLikingUsers(request)
    }

    func getLikedTweets(_ request: GetUsersLikedTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return like.getLikedTweets(request)
    }

    func postLike(_ request: PostUsersLikesRequestV2) -> TwitterAPISessionJSONTask {
        return like.postLike(request)
    }

    func deleteLike(_ request: DeleteUsersLikesRequestV2) -> TwitterAPISessionJSONTask {
        return like.deleteLike(request)
    }

    // MARK: - ListAPIv2

    func getListTweets(_ request: GetListsTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return list.getListTweets(request)
    }

    func getList(_ request: GetListRequestV2) -> TwitterAPISessionJSONTask {
        return list.getList(request)
    }

    func getLists(_ request: GetUsersOwnedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.getLists(request)
    }

    func followList(_ request: PostUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.followList(request)
    }

    func unfollowList(_ request: DeleteUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.unfollowList(request)
    }

    func listFollowers(_ request: GetListsFollowersRequestV2) -> TwitterAPISessionJSONTask {
        return list.listFollowers(request)
    }

    func followedLists(_ request: GetUsersFollowedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.followedLists(request)
    }

    func addListMember(_ request: PostListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        return list.addListMember(request)
    }

    func removeListMember(_ request: DeleteListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        return list.removeListMember(request)
    }

    func getListMemberships(_ request: GetUsersListMembershipsRequestV2) -> TwitterAPISessionJSONTask {
        return list.getListMemberships(request)
    }

    func getListMembers(_ request: GetListsMembersRequestV2) -> TwitterAPISessionJSONTask {
        return list.getListMembers(request)
    }

    func createList(_ request: PostListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.createList(request)
    }

    func updateList(_ request: PutListRequestV2) -> TwitterAPISessionJSONTask {
        return list.updateList(request)
    }

    func deleteList(_ request: DeleteListRequestV2) -> TwitterAPISessionJSONTask {
        return list.deleteList(request)
    }

    func pinnedList(_ request: GetUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.pinnedList(request)
    }

    func pinList(_ request: PostUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.pinList(request)
    }

    func unpinList(_ request: DeleteUsersPinnedListsRequestV2) -> TwitterAPISessionJSONTask {
        return list.unpinList(request)
    }

    // MARK: - RetweetAPIv2

    func getRetweetedBy(_ request: GetTweetsRetweetedByRequestV2) -> TwitterAPISessionJSONTask {
        return retweet.getRetweetedBy(request)
    }

    func postRetweet(_ request: PostUsersRetweetsRequestV2) -> TwitterAPISessionJSONTask {
        return retweet.postRetweet(request)
    }

    func deleteRetweet(_ request: DeleteUsersRetweetsRequestV2) -> TwitterAPISessionJSONTask {
        return retweet.deleteRetweet(request)
    }

    // MARK: - SearchAPIv2

    func searchTweetsRecent(_ request: GetTweetsSearchRecentRequestV2) -> TwitterAPISessionJSONTask {
        return search.searchTweetsRecent(request)
    }

    func searchTweetsAll(_ request: GetTweetsSearchAllRequestV2) -> TwitterAPISessionJSONTask {
        return search.searchTweetsAll(request)
    }

    // MARK: - SpacesAPIv2

    func getSpace(_ request: GetSpaceRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.getSpace(request)
    }

    func getSpaces(_ request: GetSpacesRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.getSpaces(request)
    }

    func getSpacesByCreators(_ request: GetSpacesByCreatorIDsRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.getSpacesByCreators(request)
    }

    func getSpacesBuyers(_ request: GetSpacesBuyersRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.getSpacesBuyers(request)
    }

    func getSPacesTweets(_ request: GetSpacesTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.getSPacesTweets(request)
    }

    func searchSpaces(_ request: GetSpacesSearchRequestV2) -> TwitterAPISessionJSONTask {
        return spaces.searchSpaces(request)
    }

    // MARK: - StreamAPIv2

    func sampleStream(_ request: GetTweetsSampleStreamRequestV2) -> TwitterAPISessionStreamTask {
        return stream.sampleStream(request)
    }

    func getSearchStreamRules(_ request: GetTweetsSearchStreamRulesRequestV2) -> TwitterAPISessionJSONTask {
        return stream.getSearchStreamRules(request)
    }

    func postSearchStreamRules(_ request: PostTweetsSearchStreamRulesRequestV2) -> TwitterAPISessionJSONTask {
        return stream.postSearchStreamRules(request)
    }

    func searchStream(_ request: GetTweetsSearchStreamRequestV2) -> TwitterAPISessionStreamTask {
        return stream.searchStream(request)
    }

    // MARK: - TimelineAPIv2

    func getUserTweets(_ request: GetUsersTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return timeline.getUserTweets(request)
    }

    func getUserMensions(_ request: GetUsersMentionsRequestV2) -> TwitterAPISessionJSONTask {
        return timeline.getUserMensions(request)
    }

    func getUserReverseChronological(_ request: GetUsersTimelinesReverseChronologicalRequestV2)
        -> TwitterAPISessionJSONTask
    {
        return timeline.getUserReverseChronological(request)
    }

    // MARK: - TweetAPIv2

    func getTweets(_ request: GetTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.getTweets(request)
    }

    func getTweet(_ request: GetTweetRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.getTweet(request)
    }

    func getQuoteTweets(_ request: GetTweetsQuoteTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.getQuoteTweets(request)
    }

    func deleteTweet(_ request: DeleteTweetRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.deleteTweet(request)
    }

    func postTweet(_ request: PostTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.postTweet(request)
    }

    func hideReply(_ request: PutTweetsHiddenRequestV2) -> TwitterAPISessionJSONTask {
        return tweet.hideReply(request)
    }

    // MARK: - TweetCountAPIv2

    func getTweetCountRecent(_ request: GetTweetsCountsRecentRequestV2) -> TwitterAPISessionJSONTask {
        return tweetCount.getTweetCountRecent(request)
    }

    func getTweetCountAll(_ request: GetTweetsCountsAllRequestV2) -> TwitterAPISessionJSONTask {
        return tweetCount.getTweetCountAll(request)
    }

    // MARK: - UserAPIv2

    func getUser(_ request: GetUserRequestV2) -> TwitterAPISessionJSONTask {
        return user.getUser(request)
    }

    func getUsers(_ request: GetUsersRequestV2) -> TwitterAPISessionJSONTask {
        return user.getUsers(request)
    }

    func getUserByUsername(_ request: GetUsersByUsernameRequestV2) -> TwitterAPISessionJSONTask {
        return user.getUserByUsername(request)
    }

    func getUsersByUsernames(_ request: GetUsersByRequestV2) -> TwitterAPISessionJSONTask {
        return user.getUsersByUsernames(request)
    }

    func getMe(_ request: GetUsersMeRequestV2) -> TwitterAPISessionJSONTask {
        return user.getMe(request)
    }

    // MARK: - DirectMessageAPIv2

    func getDmEvents(_ request: GetDmEventsRequestV2) -> TwitterAPISessionJSONTask {
        return dm.getDmEvents(request)
    }

    func getDmEventsWithParticipantId(_ request: GetDmConversationsWithParticipantIdDmEventsRequestV2)
        -> TwitterAPISessionJSONTask
    {
        return dm.getDmEventsWithParticipantId(request)
    }

    func getDmEventsByConversationsId(_ request: GetDmConversationsIdDmEventsRequestV2) -> TwitterAPISessionJSONTask {
        return dm.getDmEventsByConversationsId(request)
    }

    func postDmConversationById(_ request: PostDmConversationByIdRequestV2) -> TwitterAPISessionJSONTask {
        return dm.postDmConversationById(request)
    }

    func postDmConversationWithUser(_ request: PostDmConversationWithUserRequestV2) -> TwitterAPISessionJSONTask {
        return dm.postDmConversationWithUser(request)
    }

    func postDmConversation(_ request: PostDmConversationRequestV2) -> TwitterAPISessionJSONTask {
        return dm.postDmConversation(request)
    }
}
