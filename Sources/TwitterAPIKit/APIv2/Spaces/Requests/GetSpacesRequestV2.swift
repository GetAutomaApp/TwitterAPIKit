import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/spaces/lookup/api-reference/get-spaces
open class GetSpacesRequestV2: TwitterAPIRequest {
    public let ids: [String]
    public let expansions: Set<TwitterSpaceExpansionsV2>?
    public let spaceFields: Set<TwitterSpaceFieldsV2>?
    public let topicFields: Set<TwitterTopicFieldsV2>?
    public let userFields: Set<TwitterUserFieldsV2>?

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "/2/spaces"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["ids"] = ids.joined(separator: ",")
        expansions?.bind(param: &params)
        spaceFields?.bind(param: &params)
        topicFields?.bind(param: &params)
        userFields?.bind(param: &params)
        return params
    }

    public init(
        ids: [String],
        expansions: Set<TwitterSpaceExpansionsV2>? = .none,
        spaceFields: Set<TwitterSpaceFieldsV2>? = .none,
        topicFields: Set<TwitterTopicFieldsV2>? = .none,
        userFields: Set<TwitterUserFieldsV2>? = .none
    ) {
        self.ids = ids
        self.expansions = expansions
        self.spaceFields = spaceFields
        self.topicFields = topicFields
        self.userFields = userFields
    }
}
