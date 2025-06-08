import Foundation
import TwitterAPIKit

struct GetUserTweetsResponseV2: Decodable {
    struct Tweet: Decodable {
        let id: String
        let text: String
        let created_at: String
    }
    
    struct Meta: Decodable {
        let result_count: Int
        let next_token: String?
    }
    
    let data: [Tweet]
    let meta: Meta
}

struct GetUserTweetsRequestV2: TwitterAPIRequest {
    typealias Response = GetUserTweetsResponseV2
    
    let method: HTTPMethod = .get
    let path: String
    let parameters: [String: Any]
    
    init(userId: String, maxResults: Int = 10, paginationToken: String? = nil) {
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
    
    var parameterForOAuth: [String: Any] {
        print("🔐 Getting parameters for OAuth signature")
        print("📋 Original parameters: \(parameters)")
        // For API v2, we include query parameters in OAuth signature
        return parameters
    }
}

@main
struct GetUserTweetsExample {
    static func main() async throws {
        // Your Twitter API credentials
        let apiKey = "KebJ7nY7FPcsiMuUkjhMXTUMf"
        let apiSecret = "zJDH1jlx9WWMT2ekRuYaABX1Zb8JMBpKo2mdn4FaNCYAtBdnKo"
        let accessToken = "1859607209115619328-R9oNXSPOfI3oMYw1IQOcdIFROOJMKM"
        let accessTokenSecret = "cxI6j6nG3bNcm1qYUflMKSmSKC5nlVrgKWQJ3r7P4kL0B"
        
        // Create the environment with your credentials
        let simpleClient = SimpleTwitterAPISession(
            consumerKey: apiKey,
            consumerSecret: apiSecret,
            oauthToken: accessToken,
            oauthTokenSecret: accessTokenSecret
        )
        
        // Create request to fetch tweets from your own account
        let request = GetUserTweetsRequestV2(userId: "1859607209115619328")
        
        do {
            // Make the request
            let response = try await simpleClient.send(request)
            
            // Print the tweets
            print("\n📱 User's Tweets:")
            for tweet in response.data {
                print("\nTweet ID: \(tweet.id)")
                print("Text: \(tweet.text)")
                print("Created at: \(tweet.created_at)")
            }
            
            // Print pagination info
            print("\n📊 Meta Information:")
            print("Result count: \(response.meta.result_count)")
            if let nextToken = response.meta.next_token {
                print("Next token: \(nextToken)")
            }
            
        } catch {
            print("❌ Error fetching tweets: \(error)")
        }
    }
} 