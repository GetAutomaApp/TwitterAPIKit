import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request retrieves the count of tweets matching a search query from the last 7 days.
/// The response includes tweet counts aggregated by the specified granularity (minute, hour, or day).
public struct GetTweetsCountsRecentRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterTweetCountsResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String = "/2/tweets/counts/recent"
    public let parameters: [String: Any]
    
    public init(
        query: String,
        endTime: Date? = nil,
        granularity: TweetCountGranularityV2? = nil,
        sinceID: String? = nil,
        startTime: Date? = nil,
        untilID: String? = nil
    ) {
        var params: [String: Any] = ["query": query]
        
        if let endTime = endTime {
            params["end_time"] = ISO8601DateFormatter().string(from: endTime)
        }
        if let granularity = granularity {
            params["granularity"] = granularity.rawValue
        }
        if let sinceID = sinceID {
            params["since_id"] = sinceID
        }
        if let startTime = startTime {
            params["start_time"] = ISO8601DateFormatter().string(from: startTime)
        }
        if let untilID = untilID {
            params["until_id"] = untilID
        }
        
        self.parameters = params
    }
} 