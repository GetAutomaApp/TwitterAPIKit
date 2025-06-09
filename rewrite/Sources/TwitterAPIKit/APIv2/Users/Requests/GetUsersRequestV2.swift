import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users
public struct GetUsersRequestV2: TwitterAPIRequest {
    public typealias Response = TwitterUsersResponseV2
    
    public let method: HTTPMethod = .get
    public let path: String = "/2/users"
    public let parameters: [String: Any]
    
    public init(
        ids: [String],
        expansions: Set<TwitterUserExpansionsV2>? = nil,
        tweetFields: Set<TwitterTweetFieldsV2>? = nil,
        userFields: Set<TwitterUserFieldsV2>? = nil
    ) {
        var params: [String: Any] = [
            "ids": ids.joined(separator: ",")
        ]
        
        expansions?.bind(param: &params)
        tweetFields?.bind(param: &params)
        userFields?.bind(param: &params)
        
        self.parameters = params
    }
} 