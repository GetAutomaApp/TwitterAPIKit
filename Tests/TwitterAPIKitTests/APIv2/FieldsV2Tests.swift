// FieldsV2Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import XCTest

@testable import TwitterAPIKit

internal class FieldsV2Tests: XCTestCase {
    public func testTwitterTweetFieldsV2() throws {
        let allCases: [TwitterTweetFieldsV2] = [
            .attachments,
            .authorID,
            .contextAnnotations,
            .conversationID,
            .createdAt,
            .entities,
            .geo,
            .id,
            .inReplyToUserID,
            .lang,
            .nonPublicMetrics,
            .publicMetrics,
            .organicMetrics,
            .promotedMetrics,
            .possiblySensitive,
            .referencedTweets,
            .replySettings,
            .source,
            .text,
            .withheld,
            .other("~~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.TweetFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "attachments,author_id,context_annotations," +
                "conversation_id,created_at,entities,geo,id," +
                "in_reply_to_user_id,lang,non_public_metrics," +
                "organic_metrics,possibly_sensitive,promoted_metrics," +
                "public_metrics,referenced_tweets,reply_settings,source,text,withheld,~~~"
        )
    }

    public func testTwitterTweetFieldsV2All() throws {
        XCTAssertEqual(TwitterTweetFieldsV2.all.count, 20)
    }

    public func testTwitterUserFieldsV2() throws {
        let allCases: [TwitterUserFieldsV2] = [
            .createdAt,
            .description,
            .entities,
            .id,
            .location,
            .name,
            .pinnedTweetID,
            .profileImageUrl,
            .protected,
            .publicMetrics,
            .url,
            .username,
            .verified,
            .withheld,
            .other("~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.UserFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "created_at,description,entities," +
                "id,location,name,pinned_tweet_id," +
                "profile_image_url,protected,public_metrics,url,username,verified,withheld,~~"
        )
    }

    public func testTwitterUserFieldsV2All() throws {
        XCTAssertEqual(TwitterUserFieldsV2.all.count, 14)
    }

    public func testTwitterPlaceFieldsV2() throws {
        let allCases: [TwitterPlaceFieldsV2] = [
            .containedWithin,
            .country,
            .countryCode,
            .fullName,
            .geo,
            .id,
            .name,
            .placeType,
            .other("~~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.PlaceFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "contained_within,country,country_code,full_name,geo,id,name,place_type,~~~"
        )
    }

    public func testTwitterPlaceFieldsV2All() throws {
        XCTAssertEqual(TwitterPlaceFieldsV2.all.count, 8)
    }

    public func testTwitterPollFieldsV2() throws {
        let allCases: [TwitterPollFieldsV2] = [
            .durationMinutes,
            .endDatetime,
            .id,
            .options,
            .votingStatus,
            .other("~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.PollFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "duration_minutes,end_datetime,id,options,voting_status,~~"
        )
    }

    public func testTwitterPollFieldsV2All() throws {
        XCTAssertEqual(TwitterPollFieldsV2.all.count, 5)
    }

    public func testTwitterMediaFieldsV2() throws {
        let allCases: [TwitterMediaFieldsV2] = [
            .durationMs,
            .height,
            .mediaKey,
            .previewImageUrl,
            .type,
            .url,
            .width,
            .publicMetrics,
            .nonPublicMetrics,
            .organicMetrics,
            .promotedMetrics,
            .altText,
            .variants,
            .other("~~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.MediaFieldsParameter.schema.items.enum | sort | join(",")'

        // Note: `url` is missing in
        // https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/media
        // https://twittercommunity.com/t/documentation-for-media-object-missing-url-field/163062
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "alt_text,duration_ms,height,media_key" +
                ",non_public_metrics,organic_metrics,preview_image_url" +
                ",promoted_metrics,public_metrics,type,url,variants,width,~~~"
        )
    }

    public func testTwitterMediaFieldsV2All() throws {
        XCTAssertEqual(TwitterMediaFieldsV2.all.count, 13)
    }

    public func testTwitterListFieldsV2() throws {
        let allCases: [TwitterListFieldsV2] = [
            .createdAt,
            .followerCount,
            .memberCount,
            .private,
            .description,
            .id,
            .name,
            .ownerID,
            .other("~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.ListFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "created_at,description,follower_count,id,member_count,name,owner_id,private,~"
        )
    }

    public func testTwitterListFieldsV2All() throws {
        XCTAssertEqual(TwitterListFieldsV2.all.count, 8)
    }

    public func testTwitterSpaceFieldsV2() throws {
        let allCases: [TwitterSpaceFieldsV2] = [
            .id,
            .state,
            .hostIDs,
            .createdAt,
            .creatorID,
            .lang,
            .invitedUserIDs,
            .participantCount,
            .speakerIDs,
            .startedAt,
            .endedAt,
            .subscriberCount,
            .topicIDs,
            .title,
            .updatedAt,
            .scheduledStart,
            .isTicketed,
            .other("~~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.SpaceFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "created_at,creator_id,ended_at,host_ids," +
                "id,invited_user_ids,is_ticketed,lang,participant_count," +
                "scheduled_start,speaker_ids,started_at,state,subscriber_count,title,topic_ids,updated_at,~~"
        )
    }

    public func testTwitterSpaceFieldsV2All() throws {
        XCTAssertEqual(TwitterSpaceFieldsV2.all.count, 17)
    }

    public func testTwitterTopicFieldsV2() throws {
        let allCases: [TwitterTopicFieldsV2] = [
            .id,
            .name,
            .description,
            .other("~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.TopicFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "description,id,name,~"
        )
    }

    public func testTwitterTopicFieldsV2All() throws {
        XCTAssertEqual(TwitterTopicFieldsV2.all.count, 3)
    }

    public func testTwitterDmEventFieldsV2() throws {
        let allCases: [TwitterDmEventFieldsV2] = [
            .attachments,
            .createdAt,
            .dmConversationID,
            .eventType,
            .id,
            .participantIDs,
            .referencedTweets,
            .senderID,
            .text,
            .other("~"),
        ].shuffled()

        // curl https://api.twitter.com/2/openapi.json | \
        // jq '.components.parameters.DmEventFieldsParameter.schema.items.enum | sort | join(",")'
        XCTAssertEqual(
            allCases.commaSeparatedString,
            "attachments,created_at,dm_conversation_id,event_type,id,participant_ids,referenced_tweets,sender_id,text,~"
        )
    }

    public func testTwitterDmEventFieldsV2All() throws {
        XCTAssertEqual(TwitterDmEventFieldsV2.all.count, 9)
    }

    public func testTwitterDmConversationFieldsV2() throws {
        let allCases: [TwitterDmConversationFieldsV2] = [
            .id,
            .other("~"),
        ].shuffled()
        XCTAssertEqual(allCases.commaSeparatedString, "id,~")
    }

    public func testTwitterDmConversationFieldsV2All() throws {
        XCTAssertEqual(TwitterDmConversationFieldsV2.all.count, 1)
    }

    deinit {
        // De-init Logic Here
    }
}
