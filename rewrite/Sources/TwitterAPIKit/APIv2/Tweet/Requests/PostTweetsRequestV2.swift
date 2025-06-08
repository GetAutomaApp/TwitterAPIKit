// PostTweetsRequest.swift
import Foundation

public struct PostTweetsResponseV2: Decodable, Sendable {
    public struct Data: Decodable, Sendable {
        public let id: String
        public let text: String
    }
    public let data: Data
}

public struct PostTweetsRequestV2: TwitterAPIRequest {
    public typealias Response = PostTweetsResponseV2

    public let method: HTTPMethod = .post
    public let path: String = "/2/tweets"
    public let parameters: [String: Any]

    public init(text: String) {
        print("📝 Creating PostTweetsRequestV2")
        print("📋 Text: \(text)")
        self.parameters = ["text": text]
        print("📋 Parameters: \(self.parameters)")
    }

    public var bodyContentType: BodyContentType {
        .json
    }
    
    public var parameterForOAuth: [String: Any] {
        print("🔐 Getting parameters for OAuth signature")
        print("📋 Original parameters: \(parameters)")
        // For API v2, we don't include body parameters in OAuth signature
        return [:]
    }
}