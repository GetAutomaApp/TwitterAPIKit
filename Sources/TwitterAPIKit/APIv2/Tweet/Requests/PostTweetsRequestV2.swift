// PostTweetsRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/manage-tweets/api-reference/post-tweets
public struct PostTweetsRequestV2: TwitterAPIRequest {
    public struct Geo: Sendable {
        public let placeID: String

        public init(placeID: String) {
            self.placeID = placeID
        }

        public func bind(param: inout [String: Any]) {
            var params = [String: Any]()

            params["place_id"] = placeID

            param["geo"] = params
        }
    }

    public struct Media: Sendable {
        public let mediaIDs: [String]
        public let taggedUserIDs: [String]?

        public init(
            mediaIDs: [String],
            taggedUserIDs: [String]? = .none
        ) {
            self.mediaIDs = mediaIDs
            self.taggedUserIDs = taggedUserIDs
        }

        public func bind(param: inout [String: Any]) {
            var params = [String: Any]()

            params["media_ids"] = mediaIDs
            taggedUserIDs.map { params["tagged_user_ids"] = $0 }

            param["media"] = params
        }
    }

    public struct Poll: Sendable {
        public let durationMinutes: Int
        public let options: [String]

        public init(
            durationMinutes: Int,
            options: [String]
        ) {
            self.durationMinutes = durationMinutes
            self.options = options
        }

        public func bind(param: inout [String: Any]) {
            var params = [String: Any]()

            params["duration_minutes"] = durationMinutes
            params["options"] = options

            param["poll"] = params
        }
    }

    public struct Reply: Sendable {
        public let excludeReplyUserIDs: [String]?
        public let inReplyToTweetID: String

        public init(
            excludeReplyUserIDs: [String]? = .none,
            inReplyToTweetID: String
        ) {
            self.excludeReplyUserIDs = excludeReplyUserIDs
            self.inReplyToTweetID = inReplyToTweetID
        }

        public func bind(param: inout [String: Any]) {
            var params = [String: Any]()

            excludeReplyUserIDs.map { params["exclude_reply_user_ids"] = $0 }
            params["in_reply_to_tweet_id"] = inReplyToTweetID

            param["reply"] = params
        }
    }

    public enum ReplySettings: String, Sendable {
        case mentionedUsers
        case following
        case everyone

        public func bind(param: inout [String: Any]) {
            param["reply_settings"] = rawValue
        }
    }

    public let directMessageDeepLink: String?
    public let forSuperFollowersOnly: Bool?
    public let geo: Geo?
    public let media: Media?
    public let poll: Poll?
    public let quoteTweetID: String?
    public let reply: Reply?
    public let replySettings: ReplySettings?
    public let text: String?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/2/tweets"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        directMessageDeepLink.map { params["direct_message_deep_link"] = $0 }
        forSuperFollowersOnly.map { params["for_super_followers_only"] = $0 }
        geo?.bind(param: &params)
        media?.bind(param: &params)
        poll?.bind(param: &params)
        quoteTweetID.map { params["quote_tweet_id"] = $0 }
        reply?.bind(param: &params)
        replySettings?.bind(param: &params)
        text.map { params["text"] = $0 }
        return params
    }

    public init(
        directMessageDeepLink: String? = .none,
        forSuperFollowersOnly: Bool? = .none,
        geo: PostTweetsRequestV2.Geo? = .none,
        media: PostTweetsRequestV2.Media? = .none,
        poll: PostTweetsRequestV2.Poll? = .none,
        quoteTweetID: String? = .none,
        reply: PostTweetsRequestV2.Reply? = .none,
        replySettings: PostTweetsRequestV2.ReplySettings? = .none,
        text: String? = .none
    ) {
        self.directMessageDeepLink = directMessageDeepLink
        self.forSuperFollowersOnly = forSuperFollowersOnly
        self.geo = geo
        self.media = media
        self.poll = poll
        self.quoteTweetID = quoteTweetID
        self.reply = reply
        self.replySettings = replySettings
        self.text = text
    }

}
