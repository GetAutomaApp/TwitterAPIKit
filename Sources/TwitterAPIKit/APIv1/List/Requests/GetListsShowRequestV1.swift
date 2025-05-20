// GetListsShowRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// For more details, see:
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/
/// create-manage-lists/api-reference/get-lists-show
open class GetListsShowRequestV1: TwitterAPIRequest {
    public let list: TwitterListIdentifierV1

    public var method: HTTPMethod {
        .get
    }

    public var path: String {
        "/1.1/lists/show.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        list.bind(param: &params)
        return params
    }

    public init(
        list: TwitterListIdentifierV1
    ) {
        self.list = list
    }

    deinit {
        // De-init Logic Here
    }
}
