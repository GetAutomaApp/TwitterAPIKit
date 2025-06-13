import Foundation

/// Represents the time granularity for tweet count aggregation.
public enum TweetCountGranularityV2: String, Codable {
    /// Count tweets by minute
    case minute
    /// Count tweets by hour
    case hour
    /// Count tweets by day
    case day
} 