import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request retrieves the total count of tweets matching a search query across the entire Twitter archive.
/// The response includes tweet counts aggregated by the specified granularity (minute, hour, or day).
/// Note: This endpoint requires Academic Research access.
public struct GetTweetsCountsAllRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterTweetCountsResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String = "/2/tweets/counts/all"
    public let parameters: [String: Any]
    
    public init(
        query: String,
        endTime: Date? = nil,
        granularity: TweetCountGranularityV2? = nil,
        nextToken: String? = nil,
        sinceID: String? = nil,
        startTime: Date? = nil,
        untilID: String? = nil
    ) {
        var params: [String: Any] = ["query": query]
        
        if let endTime {
            params["end_time"] = ISO8601DateFormatter().string(from: endTime)
        }
        if let granularity {
            params["granularity"] = granularity.rawValue
        }
        if let nextToken {
            params["next_token"] = nextToken
        }
        if let sinceID {
            params["since_id"] = sinceID
        }
        if let startTime {
            params["start_time"] = ISO8601DateFormatter().string(from: startTime)
        }
        if let untilID {
            params["until_id"] = untilID
        }
        
        self.parameters = params
    }
} 
