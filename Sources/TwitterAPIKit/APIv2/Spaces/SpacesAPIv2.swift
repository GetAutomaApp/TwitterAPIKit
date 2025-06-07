// SpacesAPIv2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

public struct SpacesAPIv2: Sendable {
    /// The session used for making API requests.
    public let session: TwitterAPISession
    
    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id
    public func getSpace(
        _ request: GetSpaceRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces
    public func getSpaces(
        _ request: GetSpacesRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-by-creator-ids
    public func getSpacesByCreators(
        _ request: GetSpacesByCreatorIDsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id-buyers
    public func getSpacesBuyers(
        _ request: GetSpacesBuyersRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces-id-tweets
    public func getSPacesTweets(
        _ request: GetSpacesTweetsRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// https://developer.twitter.com/en/docs/twitter-api/spaces/search/api-reference/get-spaces-search
    public func searchSpaces(
        _ request: GetSpacesSearchRequestV2
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

}
