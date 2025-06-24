import Foundation

/// [DOCUMENTATION_LINK_PLACEHOLDER]
///
/// This request retrieves the authenticated user's profile information.
/// The response includes the user's basic profile data and can be expanded to include
/// additional fields like pinned tweets, profile images, and more.
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
