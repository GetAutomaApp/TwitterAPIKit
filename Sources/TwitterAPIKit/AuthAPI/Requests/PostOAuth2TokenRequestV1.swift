import Foundation

/// https://developer.twitter.com/en/docs/authentication/api-reference/token
open class PostOAuth2TokenRequestV1: TwitterAPIRequest {
    public let grantType: String

    public var method: HTTPMethod {
        return .post
    }

    public var path: String {
        return "/oauth2/token"
    }

    open var parameters: [String: Any] {
        var params = [String: Any]()
        params["grant_type"] = grantType
        return params
    }

    public init(
        grantType: String = "client_credentials"
    ) {
        self.grantType = grantType
    }

    deinit {
        // De-init Logic Here
    }
}
