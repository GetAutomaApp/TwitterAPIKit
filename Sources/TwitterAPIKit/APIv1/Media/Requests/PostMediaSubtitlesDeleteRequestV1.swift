import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-subtitles-delete
open class PostMediaSubtitlesDeleteRequestV1: TwitterAPIRequest {
    public let mediaID: String
    public let mediaCategory: String
    /// //The language code should be a BCP47 code (e.g. 'en", "sp")
    public let subtitleLanguageCodes: [String]

    public var method: HTTPMethod {
        return .post
    }

    public var baseURLType: TwitterBaseURLType {
        return .upload
    }

    public var bodyContentType: BodyContentType {
        return .json
    }

    public var path: String {
        return "/1.1/media/subtitles/delete.json"
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
