// UploadMediaInitRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-init
public struct UploadMediaInitRequestV1: TwitterAPIRequest {
    public let command: String = "INIT"
    public let totalBytes: Int
    public let mediaType: String
    public let mediaCategory: String?
    public let additionalOwners: [String]?

    public var method: HTTPMethod {
        .post
    }

    public var baseURLType: TwitterBaseURLType {
        .upload
    }

    public var path: String {
        "/1.1/media/upload.json"
    }

    public var parameters: [String: Any] {
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

}
