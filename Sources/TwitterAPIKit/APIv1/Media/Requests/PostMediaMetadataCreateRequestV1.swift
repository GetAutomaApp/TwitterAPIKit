// PostMediaMetadataCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-metadata-create
open class PostMediaMetadataCreateRequestV1: TwitterAPIRequest {
    public let mediaID: String
    public let altText: String

    public var method: HTTPMethod {
        .post
    }

    public var baseURLType: TwitterBaseURLType {
        .upload
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var path: String {
        "/1.1/media/metadata/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()

        params["media_id"] = mediaID
        params["alt_text"] = ["text": altText]

        return params
    }

    public init(
        mediaID: String,
        altText: String
    ) {
        self.mediaID = mediaID
        self.altText = altText
    }

    deinit {
        // De-init Logic Here
    }
}
