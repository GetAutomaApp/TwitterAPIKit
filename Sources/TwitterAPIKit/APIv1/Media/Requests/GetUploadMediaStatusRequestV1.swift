// GetUploadMediaStatusRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

open class GetUploadMediaStatusRequestV1: TwitterAPIRequest {
    public let command: String = "STATUS"
    public let mediaID: String

    public var method: HTTPMethod {
        return .get
    }

    public var baseURLType: TwitterBaseURLType {
        return .upload
    }

    public var path: String {
        return "/1.1/media/upload.json"
    }

    open var parameters: [String: Any] {
        return [
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
