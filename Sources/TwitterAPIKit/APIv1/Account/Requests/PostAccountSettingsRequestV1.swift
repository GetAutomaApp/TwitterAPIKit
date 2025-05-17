// PostAccountSettingsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-settings
open class PostAccountSettingsRequestV1: TwitterAPIRequest {
    /// two letter ISO 639-1
    public let lang: String?
    /// RailsTimeZone
    public let timeZone: String?
    /// ISO 8601 (00-23)
    public let startSleepTime: Int?
    /// ISO 8601 (00-23)
    public let endSleepTime: Int?

    public let sleepTimeEnabled: Bool?
    public let trendLocationWoeid: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/account/settings.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        lang.map { params["lang"] = $0 }
        timeZone.map { params["time_zone"] = $0 }
        startSleepTime.map { params["start_sleep_time"] = $0 }
        endSleepTime.map { params["end_sleep_time"] = $0 }
        sleepTimeEnabled.map { params["sleep_time_enabled"] = $0 }
        trendLocationWoeid.map { params["trend_location_woeid"] = $0 }
        return params
    }

    public init(
        lang: String? = .none,
        timeZone: String? = .none,
        startSleepTime: Int? = .none,
        endSleepTime: Int? = .none,
        sleepTimeEnabled: Bool? = .none,
        trendLocationWoeid: String? = .none
    ) {
        self.lang = lang
        self.timeZone = timeZone
        self.startSleepTime = startSleepTime
        self.endSleepTime = endSleepTime
        self.sleepTimeEnabled = sleepTimeEnabled
        self.trendLocationWoeid = trendLocationWoeid
    }

    deinit {
        // De-init Logic Here
    }
}
