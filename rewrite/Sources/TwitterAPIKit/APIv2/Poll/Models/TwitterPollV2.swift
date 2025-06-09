// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents a poll in the Twitter API v2
public struct TwitterPollV2: Decodable, Sendable {
    public let id: String
    public let options: [TwitterPollOptionV2]
    public let durationMinutes: Int
    public let endDatetime: Date?
    public let votingStatus: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case options
        case durationMinutes = "duration_minutes"
        case endDatetime = "end_datetime"
        case votingStatus = "voting_status"
    }
}

/// Represents a poll option in the Twitter API v2
public struct TwitterPollOptionV2: Decodable, Sendable {
    public let position: Int
    public let label: String
    public let votes: Int
} 