// CollectionAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct CollectionAPIv1: Sendable {
    
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/get-collections-entries
    public func getCollectionEntries(
        _ request: GetCollectionsEntriesRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/get-collections-list
    public func getCollections(
        _ request: GetCollectionsListRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/get-collections-show
    public func getCollection(
        _ request: GetCollectionsShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-create
    public func postCreateCollection(
        _ request: PostCollectionsCreateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-destroy
    public func postDestroyCollection(
        _ request: PostCollectionsDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-entries-add
    public func postCollectionAddEntry(
        _ request: PostCollectionsEntriesAddRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-entries-curate
    public func postCollectionCurate(
        _ request: PostCollectionsEntriesCurateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-entries-move
    public func postCollectionMoveEntry(
        _ request: PostCollectionsEntriesMoveRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-entries-remove
    public func postCollectionRemoveEntry(
        _ request: PostCollectionsEntriesRemoveRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/
    /// api-reference/post-collections-update
    public func postCollectionUpdate(
        _ request: PostCollectionsUpdateRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
