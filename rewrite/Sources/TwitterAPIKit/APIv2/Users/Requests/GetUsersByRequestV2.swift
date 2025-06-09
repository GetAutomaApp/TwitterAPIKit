import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by
public struct GetUsersByRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterUsersResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String = "/2/users/by"
    public let parameters: [String: Any]
    
    public init(
        usernames: [String],
        expansions: Set<TwitterUserExpansionsV2>? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        var params: [String: Any] = [
            "usernames": usernames.joined(separator: ",")
        ]
        
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        
        self.parameters = params
    }
} 