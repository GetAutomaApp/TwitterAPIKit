import Foundation

#if canImport(FoundationNetworking)
    @_exported import FoundationNetworking
#endif

public enum TwitterBaseURLType {
    case api
    case twitter
    case upload
}

/// Twitter Environment Setup
public struct TwitterAPIEnvironment {
    public let twitterURL: URL
    public let apiURL: URL
    public let uploadURL: URL

    public init(
        twitterURL: URL? = URL(string: "https://twitter.com"),
        apiURL: URL? = URL(string: "https://api.twitter.com"),
        uploadURL: URL? = URL(string: "https://upload.twitter.com")
    ) {
        self.twitterURL = twitterURL
        self.apiURL = apiURL
        self.uploadURL = uploadURL
    }
}
