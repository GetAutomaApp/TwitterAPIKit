// PostUpdateStatusRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update
open class PostStatusesUpdateRequestV1: TwitterAPIRequest {
    public let status: String
    public let inReplyToStatusID: String?
    public let autoPopulateReplyMetadata: Bool?
    public let excludeReplyUserIDs: [String]?
    public let attachmentUrl: String?
    public let mediaIDs: [String]?
    public let possiblySensitive: Bool?
    public let location: TwitterCoordinateV1?
    public let placeID: String?
    public let displayCoordinates: Bool?
    public let trimUser: Bool?
    public let enableDMcommands: Bool?
    public let failDMcommands: Bool?
    public let cardUri: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/statuses/update.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["status"] = status
        inReplyToStatusID.map { params["in_reply_to_status_id"] = $0 }
        autoPopulateReplyMetadata.map { params["auto_populate_reply_metadata"] = $0 }
        excludeReplyUserIDs.map { params["exclude_reply_user_ids"] = $0.joined(separator: ",") }
        attachmentUrl.map { params["attachment_url"] = $0 }
        mediaIDs.map { params["media_ids"] = $0.joined(separator: ",") }
        possiblySensitive.map { params["possibly_sensitive"] = $0 }
        location?.bind(param: &params)
        placeID.map { params["place_id"] = $0 }
        displayCoordinates.map { params["display_coordinates"] = $0 }
        trimUser.map { params["trim_user"] = $0 }
        enableDMcommands.map { params["enable_dmcommands"] = $0 }
        failDMcommands.map { params["fail_dmcommands"] = $0 }
        cardUri.map { params["card_uri"] = $0 }
        return params
    }

    public init(
        status: String,
        inReplyToStatusID: String? = .none,
        autoPopulateReplyMetadata: Bool? = .none,
        excludeReplyUserIDs: [String]? = .none,
        attachmentUrl: String? = .none,
        mediaIDs: [String]? = .none,
        possiblySensitive: Bool? = .none,
        location: TwitterCoordinateV1? = .none,
        placeID: String? = .none,
        displayCoordinates: Bool? = .none,
        trimUser: Bool? = .none,
        enableDMcommands: Bool? = .none,
        failDMcommands: Bool? = .none,
        cardUri: String? = .none
    ) {
        self.status = status
        self.inReplyToStatusID = inReplyToStatusID
        self.autoPopulateReplyMetadata = autoPopulateReplyMetadata
        self.excludeReplyUserIDs = excludeReplyUserIDs
        self.attachmentUrl = attachmentUrl
        self.mediaIDs = mediaIDs
        self.possiblySensitive = possiblySensitive
        self.location = location
        self.placeID = placeID
        self.displayCoordinates = displayCoordinates
        self.trimUser = trimUser
        self.enableDMcommands = enableDMcommands
        self.failDMcommands = failDMcommands
        self.cardUri = cardUri
    }
    deinit {
        // de-init logic here
    }
}
