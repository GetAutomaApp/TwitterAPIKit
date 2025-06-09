import Foundation

public struct GetUserTweetsResponseV2: Decodable, Sendable {
    public let data: [Tweet]
    public let includes: Includes?
    public let meta: Meta
    
    public struct Tweet: Decodable, Sendable {
        public let id: String
        public let text: String
        public let createdAt: Date
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
        public let replySettings: TwitterReplySettingsV2?
        
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
            case replySettings = "reply_settings"
        }
    }
    
    public struct Includes: Decodable, Sendable {
        public let users: [TwitterUserV2]?
        public let tweets: [Tweet]?
        public let media: [TwitterMediaV2]?
        public let places: [TwitterPlaceV2]?
        public let polls: [TwitterPollV2]?
    }
    
    public struct Meta: Decodable, Sendable {
        public let resultCount: Int
        public let newestId: String?
        public let oldestId: String?
        public let nextToken: String?
        public let previousToken: String?
        
        private enum CodingKeys: String, CodingKey {
            case resultCount = "result_count"
            case newestId = "newest_id"
            case oldestId = "oldest_id"
            case nextToken = "next_token"
            case previousToken = "previous_token"
        }
    }
}

// You can request more custom fields from twitter.
// If you'd like any of these fields, please make a PR
// https://docs.x.com/x-api/posts/user-posts-timeline-by-user-id
public struct GetUserTweetsRequestV2: TwitterAPIRequest {
    public typealias Response = GetUserTweetsResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String
    public let parameters: [String: Any]
    
    public init(
        userId: String,
        maxResults: Int = 10,
        paginationToken: String? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        expansions: Set<TwitterTweetExpansionsV2>? = nil,
        mediaFields: Set<TwitterMediaFieldsV2>? = nil,
        pollFields: Set<TwitterPollFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil,
        placeFields: Set<TwitterPlaceFieldsV2>? = nil,
        exclude: Set<TweetExclusion>? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil,
        sinceId: String? = nil,
        untilId: String? = nil
    ) {
        self.path = "/2/users/\(userId)/tweets"
        
        var params: [String: Any] = [
            "max_results": maxResults
        ]
        
        if let token = paginationToken {
            params["pagination_token"] = token
        }
        
        tweetFields?.bind(param: &params)
        expansions?.bind(param: &params)
        mediaFields?.bind(param: &params)
        pollFields?.bind(param: &params)
        userFields?.bind(param: &params)
        placeFields?.bind(param: &params)
        exclude?.bind(param: &params)
        
        if let startTime = startTime {
            params["start_time"] = ISO8601DateFormatter().string(from: startTime)
        }
        
        if let endTime = endTime {
            params["end_time"] = ISO8601DateFormatter().string(from: endTime)
        }
        
        if let sinceId = sinceId {
            params["since_id"] = sinceId
        }
        
        if let untilId = untilId {
            params["until_id"] = untilId
        }
        
        self.parameters = params
    }
}

public enum TweetExclusion: String, TwitterExpansionsParameterV2, Sendable {
    case replies
    case retweets
    
    public var stringValue: String { rawValue }
}