// PostDirectMessageRequestV1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/new-event
public struct PostDirectMessageRequestV1: TwitterAPIRequest {
    public enum Attachment: Sendable {
        public enum Location: Sendable {
            case coordinate(TwitterCoordinateV1)
            case place(String /* Place ID */ )
        }

        case media(String /* Media ID */ )

        /**
         If you attach a Location, it will probably return the following error for unknown reasons.
         ```
         {
           "errors" : [
              {
                "message" : "event.message_create.message_data.attachment: unknown type location",
                "code" : 214
              }
            ]
         }
         ```
         */
        case location(Location)

        public var parameter: [String: Any] {
            switch self {
            case let .media(mediaID):
                [
                    "type": "media",
                    "media": ["id": mediaID],
                ]
            case let .location(.coordinate(coordinate)):
                [
                    "type": "location",
                    "location": [
                        "type": "shared_coordinate",
                        "shared_coordinate": [
                            "coordinates": [
                                "type": "Point",
                                "coordinates": [coordinate.lat, coordinate.long],
                            ],
                        ],
                    ],
                ]
            case let .location(.place(placeID)):
                [
                    "type": "location",
                    "location": [
                        "type": "shared_place",
                        "shared_place": [
                            "place": [
                                "id": placeID,
                            ],
                        ],
                    ],
                ]
            }
        }
    }

    public struct QuickReplyOption: Sendable {
        public let label: String
        public let description: String
        public let metadata: String

        public init(
            label: String,
            description: String,
            metadata: String
        ) {
            self.label = label
            self.description = description
            self.metadata = metadata
        }

        public var parameter: [String: String] {
            [
                "label": label,
                "description": description,
                "metadata": metadata,
            ]
        }
    }

    /// message_create.target.recipient_id
    public let targetUserID: String
    /// message_create.message_data.text
    public let message: String
    public let attachment: Attachment?
    public let quickReplyOptions: [QuickReplyOption]?

    public var method: HTTPMethod {
        .post
    }

    public var path: String {
        "/1.1/direct_messages/events/new.json"
    }

    public var bodyContentType: BodyContentType {
        .json
    }

    public var parameters: [String: Any] {
        var messageData: [String: Any] = [
            "text": message,
        ]

        attachment.map { messageData["attachment"] = $0.parameter }
        quickReplyOptions.map {
            messageData["quick_reply"] = [
                "type": "options",
                "options": $0.map(\.parameter),
            ]
        }

        return [
            "event": [
                "type": "message_create",
                "message_create": [
                    "target": [
                        "recipient_id": targetUserID,
                    ],
                    "message_data": messageData,
                ],
            ],
        ]
    }

    public init(
        targetUserID: String,
        message: String,
        attachment: Attachment? = .none,
        quickReplyOptions: [QuickReplyOption]? = .none
    ) {
        self.targetUserID = targetUserID
        self.message = message
        self.attachment = attachment
        self.quickReplyOptions = quickReplyOptions
    }

}
