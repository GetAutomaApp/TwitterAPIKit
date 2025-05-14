import Foundation

/// Returns DM Events for a DM Conversation
/// Required OAuth 2.0 scopes: dm.read, tweet.read, users.read
open class GetDmConversationsIdDmEventsRequestV2: TwitterAPIRequest {
    /// The DM Conversation ID.
    public let id: String
    /// The maximum number of results.
    public let maxResults: Int?
    /// This parameter is used to get a specified 'page' of results.
    public let paginationToken: String?
    /// The set of event_types to include in the results.
    public let eventTypes: Set<TwitterDirectMessageEventTypeV2>?
    /// A comma separated list of DmEvent fields to display.
    public let dmEventFields: Set<TwitterDmEventFieldsV2>?
    /// A comma separated list of fields to expand.
    public let expansions: Set<TwitterDmEventExpansionsV2>?
    /// A comma separated list of Media fields to display.
    public let mediaFields: Set<TwitterMediaFieldsV2>?
    /// A comma separated list of User fields to display.
    public let userFields: Set<TwitterUserFieldsV2>?
    /// A comma separated list of Tweet fields to display.
    public let tweetFields: Set<TwitterTweetFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/dm_conversations/\(id)/dm_events"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        maxResults.map { params["max_results"] = $0 }
        paginationToken.map { params["pagination_token"] = $0 }
        eventTypes?.bind(param: &params)
        dmEventFields?.bind(param: &params)
        expansions?.bind(param: &params)
        mediaFields?.bind(param: &params)
        userFields?.bind(param: &params)
        tweetFields?.bind(param: &params)
        return params
    }

    public init(
        id: String,
        maxResults: Int? = .none,
        paginationToken: String? = .none,
        eventTypes: Set<TwitterDirectMessageEventTypeV2>? = .none,
        dmEventFields: Set<TwitterDmEventFieldsV2>? = .none,
        expansions: Set<TwitterDmEventExpansionsV2>? = .none,
        mediaFields: Set<TwitterMediaFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none,
        tweetFields: Set<TwitterTweetFieldsV2>? = .none
    ) {
        self.id = id
        self.maxResults = maxResults
        self.paginationToken = paginationToken
        self.eventTypes = eventTypes
        self.dmEventFields = dmEventFields
        self.expansions = expansions
        self.mediaFields = mediaFields
        self.userFields = userFields
        self.tweetFields = tweetFields
    }

    deinit {
        // De-init Logic Here
    }
}
