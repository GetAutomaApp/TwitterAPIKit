// PostMediaSubtitlesDeleteRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-subtitles-delete
open class PostMediaSubtitlesDeleteRequestV1: TwitterAPIRequest {
    public let mediaID: String
    public let mediaCategory: String
    /// //The language code should be a BCP47 code (e.g. 'en", "sp")
    public let subtitleLanguageCodes: [String]

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
        "/1.1/media/subtitles/delete.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["media_id"] = mediaID
        params["media_category"] = mediaCategory
        params["subtitle_info"] = [
            "subtitles": subtitleLanguageCodes.map {
                ["language_code": $0]
            },
        ]
        return params
    }

    public init(
        mediaID: String,
        mediaCategory: String,
        subtitleLanguageCodes: [String]
    ) {
        self.mediaID = mediaID
        self.mediaCategory = mediaCategory
        self.subtitleLanguageCodes = subtitleLanguageCodes
    }

    deinit {
        // De-init Logic Here
    }
}
