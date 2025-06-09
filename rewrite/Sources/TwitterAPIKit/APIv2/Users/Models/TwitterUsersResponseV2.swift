import Foundation

/// Response type for multiple user endpoints
public struct TwitterUsersResponseV2: Decodable, Sendable {
    public let data: [TwitterUserV2]
    public let includes: TwitterIncludesV2?
} 