// PostTweetsSearchStreamRulesRequestV2.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/tweets/filtered-stream/api-reference/post-tweets-search-stream-rules#Validate
open class PostTweetsSearchStreamRulesRequestV2: TwitterAPIRequest {
    public struct Rule {
        public let value: String
        public let tag: String?
        public init(value: String, tag: String? = .none) {
            self.value = value
            self.tag = tag
        }
    }

    public enum Operation {
        case add([Rule])
        case delete([String] /* rule IDs */ )
    }

    public let dryRun: Bool?
    public let operation: PostTweetsSearchStreamRulesRequestV2.Operation

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/2/tweets/search/stream/rules"
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    open var queryParameters: [String: Any] {
        var params = [String: Any]()
        dryRun.map { params["dry_run"] = $0 }
        return params
    }

    open var bodyParameters: [String: Any] {
        var params = [String: Any]()

        switch operation {
        case let .add(rules):
            params["add"] = rules.map {
                [
                    "value": $0.value,
                    "tag": $0.tag,
                ].compactMapValues { $0 }
            }
        case let .delete(ids):
            params["delete"] = ["ids": ids]
        }

        return params
    }

    public init(
        operation: Operation,
        dryRun: Bool? = .none
    ) {
        self.operation = operation
        self.dryRun = dryRun
    }
}
