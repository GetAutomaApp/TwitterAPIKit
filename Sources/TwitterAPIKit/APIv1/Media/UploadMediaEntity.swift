// UploadMediaEntity.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public struct UploadMediaRequestParameters {
    public let media: Data
    public let mediaType: String
    public let filename: String
    public let mediaCategory: String?
    public let additionalOwners: [String]?
    /// Byte
    public let uploadChunkSize: Int?

    /// filename can be any value. ex) hoge.mp4
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
    struct UploadMediaInitResponse: Decodable {
        public let mediaID: String
        public let expiresAfterSecs: Int

        private enum CodingKeys: String, CodingKey {
            case mediaID = "mediaIdString"
            case expiresAfterSecs
        }
    }

    struct UploadMediaVideo: Decodable {
        public let videoType: String
    }

    struct UploadMediaProcessingInfo: Decodable {
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

    struct UploadMediaFinalizeResponse: Decodable {
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

    struct UploadMediaStatusResponse: Decodable {
        public var state: UploadMediaProcessingInfo.State {
            return processingInfo.enumState
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
