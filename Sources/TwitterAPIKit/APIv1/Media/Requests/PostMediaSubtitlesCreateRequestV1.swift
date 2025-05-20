// PostMediaSubtitlesCreateRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-subtitles-create
open class PostMediaSubtitlesCreateRequestV1: TwitterAPIRequest {
    public struct Subtitle {
        public let mediaID: String
        /// The language code should be a BCP47 code (e.g. 'en", "sp")
        public let languageCode: String
        public let displayName: String

        public init(
            mediaID: String,
            languageCode: String,
            displayName: String
        ) {
            self.mediaID = mediaID
            self.languageCode = languageCode
            self.displayName = displayName
        }
    }

    public let mediaID: String
    public let mediaCategory: String
    public let subtitles: [Subtitle]

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
        "/1.1/media/subtitles/create.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["media_id"] = mediaID
        params["media_category"] = mediaCategory
        params["subtitle_info"] = [
            "subtitles": subtitles.map {
                [
                    "media_id": $0.mediaID,
                    "language_code": $0.languageCode,
                    "display_name": $0.displayName,
                ]
            },
        ]
        return params
    }

    public init(
        mediaID: String,
        mediaCategory: String,
        subtitles: [Subtitle]
    ) {
        self.mediaID = mediaID
        self.mediaCategory = mediaCategory
        self.subtitles = subtitles
    }

    deinit {
        // De-init Logic Here
    }
}
