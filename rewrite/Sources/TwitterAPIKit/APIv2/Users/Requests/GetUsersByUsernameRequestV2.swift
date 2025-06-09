import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username
public struct GetUsersByUsernameRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterUserResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String
    public let parameters: [String: Any]
    
    public init(
        username: String,
        expansions: Set<TwitterUserExpansionsV2>? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        self.path = "/2/users/by/username/\(username)"
        
        var params: [String: Any] = [:]
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        
        self.parameters = params
    }
} 