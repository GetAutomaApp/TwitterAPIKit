import Foundation

/// Response type for tweet count requests.
public struct TwitterTweetCountsResponseV2: Decodable, Sendable {
    /// The tweet count data.
    public struct Data: Decodable, Sendable {
        /// The start time of the count period.
        public let start: Date
        /// The end time of the count period.
        public let end: Date
        /// The number of tweets in this period.
        public let tweetCount: Int
    }
    
    /// The tweet count data.
    public let data: [Data]
    /// Pagination metadata.
    public let meta: Meta
    
    /// Pagination metadata for tweet count responses.
    public struct Meta: Decodable, Sendable {
        /// The total number of tweets counted.
        public let totalTweetCount: Int
        /// The next page token, if available.
        public let nextToken: String?
    }
} 