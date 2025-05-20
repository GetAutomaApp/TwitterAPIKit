// UploadMediaAppendRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-append
open class UploadMediaAppendRequestV1: TwitterAPIRequest {
    public let command: String = "APPEND"
    public let mediaID: String

    /// media filename
    public let filename: String

    /// media mime type
    public let mimeType: String
    public let media: Data
    public let segmentIndex: Int

    public var method: HTTPMethod {
        .post
    }

    public var baseURLType: TwitterBaseURLType {
        .upload
    }

    public var path: String {
        "/1.1/media/upload.json"
    }

    public var bodyContentType: BodyContentType {
        .multipartFormData
    }

    open var parameters: [String: Any] {
        [
            "command": command,
            "media_id": mediaID,
            "media": media,
            "segment_index": segmentIndex,
            "filename": filename,
            "mime_type": mimeType
        ]
    }

    public required init(
        mediaID: String,
        filename: String,
        mimeType: String,
        media: Data,
        segmentIndex: Int = 0
    ) {
        self.mediaID = mediaID
        self.filename = filename
        self.mimeType = mimeType
        self.media = media
        self.segmentIndex = segmentIndex
    }

    open func segments(maxBytes: Int) -> [UploadMediaAppendRequestV1] {
        var requests = [Self]()
        let totalDataSize = media.count
        var currentSegmentIndex = 0
        repeat {
            currentSegmentIndex = segmentIndex + requests.count
            let start = currentSegmentIndex * maxBytes
            let len = min(totalDataSize - start, maxBytes)
            let req = Self(
                mediaID: mediaID,
                filename: filename,
                mimeType: mimeType,
                media: media.subdata(in: start ..< (start + len)),
                segmentIndex: currentSegmentIndex
            )
            requests.append(req)
        } while ((currentSegmentIndex + 1) * maxBytes) < totalDataSize

        return requests
    }

    deinit {
        // De-init Logic Here
    }
}
