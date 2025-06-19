import Foundation

/// Response type for single user endpoints
public struct TwitterUserResponseV2: Decodable, Sendable {
    public let data: TwitterUserV2
    public let includes: TwitterIncludesV2?
} 