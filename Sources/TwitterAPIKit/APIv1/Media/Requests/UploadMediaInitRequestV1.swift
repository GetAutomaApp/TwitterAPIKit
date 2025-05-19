// UploadMediaInitRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-init
open class UploadMediaInitRequestV1: TwitterAPIRequest {
    public let command: String = "INIT"
    public let totalBytes: Int
    public let mediaType: String
    public let mediaCategory: String?
    public let additionalOwners: [String]?

    public var method: HTTPMethod {
        return .post
    }

    public var baseURLType: TwitterBaseURLType {
        return .upload
    }

    public var path: String {
        return "/1.1/media/upload.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["command"] = command
        params["total_bytes"] = totalBytes
        params["media_type"] = mediaType
        mediaCategory.map { params["media_category"] = $0 }
        additionalOwners.map { params["additional_owners"] = $0.joined(separator: ",") }
        return params
    }

    public init(
        totalBytes: Int,
        mediaType: String,
        mediaCategory: String? = .none,
        additionalOwners: [String]? = .none
    ) {
        self.totalBytes = totalBytes
        self.mediaType = mediaType
        self.mediaCategory = mediaCategory
        self.additionalOwners = additionalOwners
    }

    deinit {
        // De-init Logic Here
    }
}
