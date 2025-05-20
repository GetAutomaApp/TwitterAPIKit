// GetUploadMediaStatusRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

open class GetUploadMediaStatusRequestV1: TwitterAPIRequest {
    public let command: String = "STATUS"
    public let mediaID: String

    public var method: HTTPMethod {
        .get
    }

    public var baseURLType: TwitterBaseURLType {
        .upload
    }

    public var path: String {
        "/1.1/media/upload.json"
    }

    open var parameters: [String: Any] {
        [
            "command": command,
            "media_id": mediaID,
        ]
    }

    public init(mediaID: String) {
        self.mediaID = mediaID
    }

    deinit {
        // De-init Logic Here
    }
}
