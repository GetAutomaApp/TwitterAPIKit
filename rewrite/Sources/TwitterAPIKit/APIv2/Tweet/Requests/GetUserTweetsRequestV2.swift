import Foundation

public struct GetUserTweetsResponseV2: Decodable {
    public struct Tweet: Decodable {
        public let id: String
        public let text: String
        public let created_at: String
    }
    
    public struct Meta: Decodable {
        public let result_count: Int
        public let next_token: String?
    }
    
    public let data: [Tweet]
    public let meta: Meta
}

public struct GetUserTweetsRequestV2: TwitterAPIRequest {
    public typealias Response = GetUserTweetsResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String
    public let parameters: [String: Any]
    
    public init(userId: String, maxResults: Int = 10, paginationToken: String? = nil) {
        print("📝 Creating GetUserTweetsRequestV2")
        print("👤 User ID: \(userId)")
        
        self.path = "/2/users/\(userId)/tweets"
        
        var params: [String: Any] = [
            "max_results": maxResults,
            "tweet.fields": "created_at"
        ]
        
        if let token = paginationToken {
            params["pagination_token"] = token
        }
        
        self.parameters = params
        print("📋 Parameters: \(self.parameters)")
    }
    
    public var parameterForOAuth: [String: Any] {
        print("🔐 Getting parameters for OAuth signature")
        print("📋 Original parameters: \(parameters)")
        // For API v2, we include query parameters in OAuth signature
        return parameters
    }
}