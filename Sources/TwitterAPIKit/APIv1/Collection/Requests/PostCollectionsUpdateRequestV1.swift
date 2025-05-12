import Foundation

/// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-update
open class PostCollectionsUpdateRequestV1: TwitterAPIRequest {
    public let id: String
    public let url: String?
    public let name: String?
    public let description: String?

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/1.1/collections/update.json"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["id"] = id
        url.map { params["url"] = $0 }
        name.map { params["name"] = $0 }
        description.map { params["description"] = $0 }
        return params
    }

    public init(
        id: String,
        url: String? = .none,
        name: String? = .none,
        description: String? = .none
    ) {
        self.id = id
        self.url = url
        self.name = name
        self.description = description
    }
}
