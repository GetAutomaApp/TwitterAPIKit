// TwitterRateLimit.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents Twitter API rate limit information extracted from response headers.
/// For more information, see:
/// - [Rate Limits Overview](https://developer.twitter.com/en/docs/rate-limits)
/// - [v1 Rate Limits](https://developer.twitter.com/en/docs/twitter-api/v1/rate-limits)
/// - [v2 Rate Limits](https://developer.twitter.com/en/docs/twitter-api/rate-limits)
public struct TwitterRateLimit {
    /// The maximum number of requests allowed in the current time window.
    public let limit: Int

    /// The number of requests remaining in the current time window.
    public let remaining: Int

    /// The time when the current rate limit window resets, in UTC epoch seconds.
    public let reset: TimeInterval

    /// Creates a rate limit object from response headers.
    /// - Parameter header: The response headers containing rate limit information.
    /// Expected headers:
    /// - x-rate-limit-limit: Maximum requests allowed
    /// - x-rate-limit-remaining: Requests remaining
    /// - x-rate-limit-reset: Reset time in epoch seconds
    /// - Returns: An initialized rate limit object if the headers contain valid data, nil otherwise.
    public init?(header: [AnyHashable: Any]) {
        guard let limit = parse(header, key: "x-rate-limit-limit"),
              let remaining = parse(header, key: "x-rate-limit-remaining"),
              let reset = parse(header, key: "x-rate-limit-reset")
        else {
            return nil
        }
        self.limit = limit
        self.remaining = remaining
        self.reset = TimeInterval(reset)
    }
}

public extension TwitterRateLimit {
    /// The date when the current rate limit window resets.
    /// This is a convenience property that converts the reset timestamp to a Date object.
    var resetDate: Date {
        Date(timeIntervalSince1970: reset)
    }
}

private func parse(_ header: [AnyHashable: Any], key: String) -> Int? {
    // Normally, the header is a String.
    if let str = header[key] as? String, let value = Int(str) {
        return value
    }

    // just in case.
    if let int = header[key] as? Int {
        return int
    }
    return nil
}
