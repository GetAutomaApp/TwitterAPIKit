// MediaAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

// swiftlint:disable function_body_length closure_body_length
open class MediaAPIv1: TwitterAPIBase {
    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/get-media-upload-status
    public func getUploadMediaStatus(
        _ request: GetUploadMediaStatusRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/post-media-upload-init
    public func uploadMediaInit(
        _ request: UploadMediaInitRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/post-media-upload-append
    public func uploadMediaAppend(
        _ request: UploadMediaAppendRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// Utility method for split uploading of large files.
    public func uploadMediaAppendSplitChunks(
        _ request: UploadMediaAppendRequestV1,
        maxBytes: Int = 5_242_880 /* 5MB */
    ) -> [TwitterAPISessionSpecializedTask<String /* mediaID */>] {
        request.segments(maxBytes: maxBytes)
            .map { req in
                uploadMediaAppend(req).specialized { _ in
                    req.mediaID
                }
            }
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/post-media-upload-finalize
    public func uploadMediaFinalize(
        _ request: UploadMediaFinalizeRequestV1
    ) -> TwitterAPISessionJSONTask {
        session.send(request)
    }

    /// Upload media utility method.
    /// INIT -> APPEND x n -> FINALIZE -> STATUS x n (If needed)
    public func uploadMedia(
        _ parameters: UploadMediaRequestParameters,
        completionHandler: @escaping (
            TwitterAPIResponse<String>
        ) -> Void
    ) {
        uploadMediaInit(
            .init(
                totalBytes: parameters.media.count,
                mediaType: parameters.mediaType,
                mediaCategory: parameters.mediaCategory,
                additionalOwners: parameters.additionalOwners
            )
        )
        .responseDecodable(
            type: TwitterAPIClient.UploadMediaInitResponse.self,
            queue: .processQueue
        )
        { [weak self] response in

            guard let self else { return }

            let mediaID: String
            do {
                mediaID = try response.result.get().mediaID
            } catch {
                completionHandler(response.map(\.mediaID))
                return
            }

            uploadMediaAppendSplitChunks(
                .init(
                    mediaID: mediaID,
                    filename: parameters.filename,
                    mimeType: parameters.mediaType,
                    media: parameters.media,
                    segmentIndex: 0
                ), maxBytes: parameters.uploadChunkSize ?? 5_242_880
            )
            .responseObject(queue: .processQueue) { [weak self] responses in

                guard let self else { return }

                if let error = responses.first(where: \.isError) {
                    completionHandler(error)
                    return
                }

                uploadMediaFinalize(.init(mediaID: mediaID))
                    .responseDecodable(
                        type: TwitterAPIClient.UploadMediaFinalizeResponse.self,
                        queue: .processQueue
                    ) { [weak self] response in
                        guard let self else { return }

                        var finalizeResult: TwitterAPIClient.UploadMediaFinalizeResponse
                        do {
                            finalizeResult = try response.result.get()
                        } catch {
                            completionHandler(response.map(\.mediaID))
                            return
                        }

                        guard let processingInfo = finalizeResult.processingInfo else {
                            completionHandler(response.map(\.mediaID))
                            return
                        }

                        waitMediaProcessing(
                            mediaID: mediaID,
                            initialWaitSec: processingInfo.checkAfterSecs ?? 0
                        ) { response in
                            completionHandler(response.map(\.mediaID))
                        }
                    }
            }
        }
    }

    public func waitMediaProcessing(
        mediaID: String,
        initialWaitSec: Int,
        completionHandler: @escaping (
            TwitterAPIResponse<TwitterAPIClient.UploadMediaStatusResponse>
        ) -> Void
    ) {
        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + .seconds(initialWaitSec)) { [weak self] in
            guard let self else { return }
            waitMediaProcessing(mediaID: mediaID, completionHandler: completionHandler)
        }
    }

    public func waitMediaProcessing(
        mediaID: String,
        completionHandler: @escaping (
            TwitterAPIResponse<TwitterAPIClient.UploadMediaStatusResponse>
        ) -> Void
    ) {
        _ = getUploadMediaStatus(.init(mediaID: mediaID))
            .responseDecodable(
                type: TwitterAPIClient.UploadMediaStatusResponse.self,
                queue: .processQueue
            ) { [weak self] response in
                guard let self else { return }

                do {
                    let success = try response.result.get()

                    switch success.state {
                    case let .pending(checkAfterSecs: sec),
                         let .inProgress(checkAfterSecs: sec, progressPercent: _):

                        waitMediaProcessing(
                            mediaID: mediaID,
                            initialWaitSec: sec,
                            completionHandler: completionHandler
                        )
                    case .succeeded:
                        completionHandler(response)
                    case let .failed(error: error):
                        throw TwitterAPIKitError.uploadMediaFailed(reason: .processingFailed(error: error))
                    case .unknown:
                        throw TwitterAPIKitError.unkonwn(
                            error: NSError(domain: "TwitterAPIKit", code: 0, userInfo: [:])
                        )
                    }
                } catch let error as TwitterAPIKitError {
                    completionHandler(
                        response.flatMap { _ in .failure(error) }
                    )
                    return
                } catch {
                    completionHandler(
                        response.flatMap { _ in .failure(.unkonwn(error: error)) }
                    )
                }
            }
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/post-media-metadata-create
    public func createMediaMetadata(
        _ request: PostMediaMetadataCreateRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/
    /// post-media-subtitles-create
    public func createSubtitle(
        _ request: PostMediaSubtitlesCreateRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    /// For more details, see:
    /// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/
    /// api-reference/
    /// post-media-subtitles-delete
    public func deleteSubtitle(
        _ request: PostMediaSubtitlesDeleteRequestV1
    ) -> TwitterAPISessionDataTask {
        session.send(request)
    }

    deinit {
        // De-init Logic Here
    }
}
// swiftlint:enable function_body_length closure_body_length
