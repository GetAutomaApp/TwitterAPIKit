// ExpansionsV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import XCTest

@testable import TwitterAPIKit

internal class ExpansionsV2Tests: XCTestCase {
    public func testTwitterTweetExpansionsV2() throws {
        let allCases: [TwitterTweetExpansionsV2] = [
            .attachmentsPollIDs,
            .attachmentsMediaKeys,
            .authorID,
            .entitiesMentionsUsername,
            .geoPlaceID,
            .inReplyToUserID,
            .referencedTweetsID,
            .referencedTweetsIDAuthorID,
            .other("~~~"),
        ]

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.TweetExpansionsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "attachments.media_keys,attachments.poll_ids,author_id," +
                "entities.mentions.username,geo.place_id,in_reply_to_user_id," +
                "referenced_tweets.id,referenced_tweets.id.author_id,~~~"
        )
    }

    public func testTwitterTweetExpansionsV2All() throws {
        XCTAssertEqual(TwitterTweetExpansionsV2.all.count, 8)
    }

    public func testTwitterUserExpansionsV2() throws {
        let allCases: [TwitterUserExpansionsV2] = [
            .pinnedTweetID,
            .other("~~~"),
        ]

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.UserExpansionsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "pinned_tweet_id,~~~"
        )
    }

    public func testTwitterUserExpansionsV2All() throws {
        XCTAssertEqual(TwitterUserExpansionsV2.all.count, 1)
    }

    public func testTwitterListExpansionsV2() throws {
        let allCases: [TwitterListExpansionsV2] = [
            .ownerID,
            .other("~~~"),
        ]

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.ListExpansionsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "owner_id,~~~"
        )
    }

    public func testTwitterListExpansionsV2All() throws {
        XCTAssertEqual(TwitterListExpansionsV2.all.count, 1)
    }

    public func testTwitterSpaceExpansionsV2() throws {
        let allCases: [TwitterSpaceExpansionsV2] = [
            .invitedUserIDs,
            .speakerIDs,
            .creatorID,
            .hostIDs,
            .topicIDs,
            .other("~~~"),
        ]

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.SpaceExpansionsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "creator_id,host_ids,invited_user_ids,speaker_ids,topic_ids,~~~"
        )
    }

    public func testTwitterSpaceExpansionsV2All() throws {
        XCTAssertEqual(TwitterSpaceExpansionsV2.all.count, 5)
    }

    public func testTwitterDmEventExpansionsV2() throws {
        let allCases: [TwitterDmEventExpansionsV2] = [
            .attachmentsMediaKeys,
            .participantIDs,
            .referencedTweetsID,
            .senderID,
            .other("~~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.DmEventExpansionsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "attachments.media_keys,participant_ids,referenced_tweets.id,sender_id,~~~"
        )
    }

    public func testTwitterDmEventExpansionsV2All() throws {
        XCTAssertEqual(TwitterDmEventExpansionsV2.all.count, 4)
    }

    deinit {
        // De-init Logic Here
    }
}
