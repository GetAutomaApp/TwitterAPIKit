// UploadMediaRequestParameters.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Parameters for uploading media to Twitter's API.
public struct UploadMediaRequestParameters {
    /// The raw media data to upload.
    public let media: Data

    /// The MIME type of the media (e.g., "image/jpeg", "video/mp4").
    public let mediaType: String

    /// The filename to use for the uploaded media.
    public let filename: String

    /// The category of media being uploaded (e.g., "tweet_image", "tweet_video").
    public let mediaCategory: String?

    /// Additional Twitter user IDs that should have permission to use this media.
    public let additionalOwners: [String]?

    /// The size of each chunk when uploading large media files, in bytes.
    public let uploadChunkSize: Int?

    /// Creates parameters for a media upload request.
    /// - Parameters:
    ///   - media: The raw media data to upload.
    ///   - mediaType: The MIME type of the media.
    ///   - filename: The filename to use (can be any value, e.g., "photo.jpg").
    ///   - mediaCategory: The category of media being uploaded (optional).
    ///   - additionalOwners: Additional user IDs that can use this media (optional).
    ///   - uploadChunkSize: Size of each chunk for chunked uploads, in bytes (optional).
    public init(
        media: Data,
        mediaType: String,
        filename: String,
        mediaCategory: String? = .none,
        additionalOwners: [String]? = .none,
        uploadChunkSize: Int? = .none
    ) {
        self.media = media
        self.mediaType = mediaType
        self.mediaCategory = mediaCategory
        self.additionalOwners = additionalOwners
        self.filename = filename
        self.uploadChunkSize = uploadChunkSize
    }
}

public extension TwitterAPIClient {
    struct UploadMediaInitResponse: Decodable, Sendable {
        public let mediaID: String
        public let expiresAfterSecs: Int

        private enum CodingKeys: String, CodingKey {
            case mediaID = "mediaIdString"
            case expiresAfterSecs
        }
    }

    struct UploadMediaVideo: Decodable, Sendable {
        public let videoType: String
    }

    struct UploadMediaProcessingInfo: Decodable, Sendable {
        public enum State {
            case pending(checkAfterSecs: Int)
            case inProgress(checkAfterSecs: Int, progressPercent: Int)
            case failed(error: TwitterAPIKitError.UploadMediaError)
            case succeeded

            case unknown
        }

        public var enumState: State {
            if state == "pending", let checkAfterSecs {
                return .pending(checkAfterSecs: checkAfterSecs)
            }

            if state == "in_progress", let checkAfterSecs, let progressPercent {
                return .inProgress(checkAfterSecs: checkAfterSecs, progressPercent: progressPercent)
            }

            if state == "failed", let error {
                return .failed(error: error)
            }

            if state == "succeeded" {
                return .succeeded
            }
            return .unknown
        }

        /// pending -> in_progress -> [failed|succeeded]
        public let state: String
        public let checkAfterSecs: Int?

        /// 0 - 100 %
        public let progressPercent: Int?
        public let error: TwitterAPIKitError.UploadMediaError?
    }

    struct UploadMediaFinalizeResponse: Decodable, Sendable {
        public let mediaID: String
        public let size: Int
        public let expiresAfterSecs: Int
        public let video: UploadMediaVideo?
        public let processingInfo: UploadMediaProcessingInfo?

        private enum CodingKeys: String, CodingKey {
            case mediaID = "mediaIdString"
            case size, expiresAfterSecs, video, processingInfo
        }
    }

    struct UploadMediaStatusResponse: Decodable, Sendable {
        public var state: UploadMediaProcessingInfo.State {
            processingInfo.enumState
        }

        public let mediaID: String
        public let expiresAfterSecs: Int?
        public let video: UploadMediaVideo?
        public let processingInfo: UploadMediaProcessingInfo

        private enum CodingKeys: String, CodingKey {
            case mediaID = "mediaIdString"
            case expiresAfterSecs, video, processingInfo
        }
    }
}
