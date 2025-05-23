// GetSearchTweetsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets
open class GetSearchTweetsRequestV1: TwitterAPIRequest {
    public enum ResultType: String {
        case mixed
        case recent
        case popular
    }

    public let query: String
    public let lang: String?
    public let count: Int?
    public let until: String?
    public let maxID: String?
    public let locale: String?
    public let geocode: String?
    public let sinceID: String?
    public let resultType: ResultType?
    public let includeEntities: Bool?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/search/tweets.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["q"] = query
        lang.map { params["lang"] = $0 }
        count.map { params["count"] = $0 }
        until.map { params["until"] = $0 }
        maxID.map { params["max_id"] = $0 }
        locale.map { params["locale"] = $0 }
        geocode.map { params["geocode"] = $0 }
        sinceID.map { params["since_id"] = $0 }
        resultType.map { params["result_type"] = $0.rawValue }
        includeEntities.map { params["include_entities"] = $0 }
        return params
    }

    public init(
        query: String,
        lang: String? = .none,
        count: Int? = .none,
        until: String? = .none,
        maxID: String? = .none,
        locale: String? = .none,
        geocode: String? = .none,
        sinceID: String? = .none,
        resultType: ResultType? = .none,
        includeEntities: Bool? = .none
    ) {
        self.query = query
        self.lang = lang
        self.count = count
        self.until = until
        self.maxID = maxID
        self.locale = locale
        self.geocode = geocode
        self.sinceID = sinceID
        self.resultType = resultType
        self.includeEntities = includeEntities
    }

    deinit {
        // de-init logic here
    }
}
