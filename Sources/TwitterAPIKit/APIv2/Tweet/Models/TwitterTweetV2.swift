// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a Tweet in the Twitter API v2
public struct TwitterTweetV2: Decodable, Sendable {
    public let id: String
    public let text: String
    public let createdAt: Date?
    public let authorId: String?
    public let conversationId: String?
    public let inReplyToUserId: String?
    public let referencedTweets: [TwitterReferencedTweetV2]?
    public let attachments: TwitterAttachmentsV2?
    public let geo: TwitterGeoV2?
    public let contextAnnotations: [TwitterContextAnnotationV2]?
    public let entities: TwitterEntitiesV2?
    public let withheld: TwitterWithheldV2?
    public let publicMetrics: TwitterPublicMetricsV2?
    public let possiblySensitive: Bool?
    public let lang: String?
    public let source: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text
        case createdAt = "created_at"
        case authorId = "author_id"
        case conversationId = "conversation_id"
        case inReplyToUserId = "in_reply_to_user_id"
        case referencedTweets = "referenced_tweets"
        case attachments
        case geo
        case contextAnnotations = "context_annotations"
        case entities
        case withheld
        case publicMetrics = "public_metrics"
        case possiblySensitive = "possibly_sensitive"
        case lang
        case source
    }
} 