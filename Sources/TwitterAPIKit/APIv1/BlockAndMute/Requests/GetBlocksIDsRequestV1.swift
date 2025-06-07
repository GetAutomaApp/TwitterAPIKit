// GetBlocksIDsRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// mute-block-report-users/api-reference/get-blocks-ids
public struct GetBlocksIDsRequestV1: TwitterAPIRequest {
    public let stringifyIDs: Bool?
    public let cursor: String?

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/blocks/ids.json"
    }

    public var parameters: [String: Any] {
        var params = [String: Any]()
        stringifyIDs.map { params["stringify_ids"] = $0 }
        cursor.map { params["cursor"] = $0 }
        return params
    }

    public init(
        stringifyIDs: Bool? = .none,
        cursor: String? = .none
    ) {
        self.stringifyIDs = stringifyIDs
        self.cursor = cursor
    }

}
