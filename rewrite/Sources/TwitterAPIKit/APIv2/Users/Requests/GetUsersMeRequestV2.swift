import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me
public struct GetUsersMeRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterUserResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String = "/2/users/me"
    public let parameters: [String: Any]
    
    public init(
        expansions: Set<TwitterUserExpansionsV2>? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        var params: [String: Any] = [:]
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        
        self.parameters = params
    }
} 