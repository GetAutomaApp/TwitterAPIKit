// PostTweetsRequest.swift
import Foundation

public struct PostTweetsResponseV2: Decodable, Sendable {
    public struct Data: Decodable, Sendable {
        public let id: String
        public let text: String
    }
    public let data: Data
}

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request creates a new tweet with the specified text content.
/// The response includes the newly created tweet's ID and content.
/// Note: This endpoint requires OAuth 1.0a User Context authentication.
public struct PostTweetsRequestV2: TwitterAPIRequest {
    public typealias Response = PostTweetsResponseV2

    public let method: HTTPMethod = .post
    public let path: String = "/2/tweets"
    public let parameters: [String: Any]

    public init(text: String) {
        self.parameters = ["text": text]
    }

    public var bodyContentType: BodyContentType {
        .json
    }
}
