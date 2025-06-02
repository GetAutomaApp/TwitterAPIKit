// TwitterAPIClient.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Main client class for interacting with the Twitter API.
/// This class provides access to both v1.1 and v2 Twitter APIs, as well as authentication endpoints.
/// It handles authentication, request signing, and provides specialized API clients for different Twitter features.
open class TwitterAPIClient {
    /// Default JSON decoder configured for Twitter API responses.
    /// This decoder handles both v1 and v2 date formats and uses snake_case key decoding.
    public static var defaultJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        // for v1
        let dateFormatterV1 = DateFormatter()
        dateFormatterV1.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterV1.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"

        // for v2
        let dateFormatterV2 = DateFormatter()
        dateFormatterV2.locale = Locale(identifier: "en_hUS_POSIX")
        dateFormatterV2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        decoder.dateDecodingStrategy = .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)

            if let date = dateFormatterV1.date(from: dateStr) {
                return date
            }

            if let date = dateFormatterV2.date(from: dateStr) {
                return date
            }
            throw DecodingError.dataCorrupted(
                .init(codingPath: decoder.codingPath, debugDescription: "Unexpected date format: \(dateStr)")
            )
        }

        return decoder
    }()

    /// Client for handling Twitter authentication flows (OAuth 1.0a and OAuth 2.0).
    public let auth: TwitterAuthAPI

    /// Client for accessing Twitter API v1.1 endpoints.
    public let v1: TwitterAPIv1

    /// Client for accessing Twitter API v2 endpoints.
    public let v2: TwitterAPIv2

    /// The session used for making API requests.
    public let session: TwitterAPISession

    /// The current authentication method being used.
    public var apiAuth: TwitterAuthenticationMethod {
        session.auth
    }

    /// Client used for refreshing OAuth 2.0 tokens.
    private var refreshOAuth20TokenClient: TwitterAPIClient?

    /// Creates a new TwitterAPIClient instance.
    /// - Parameters:
    ///   - auth: The authentication method to use for API requests.
    ///   - configuration: The URLSession configuration to use. Defaults to .default.
    ///   - environment: The Twitter API environment configuration. Defaults to standard Twitter endpoints.
    public init(
        _ auth: TwitterAuthenticationMethod,
        configuration: URLSessionConfiguration = .default,
        environment: TwitterAPIEnvironment = .init()
    ) {
        session = TwitterAPISession(
            auth: auth,
            configuration: configuration,
            environment: environment
        )
        self.auth = TwitterAuthAPI(session: session)
        v1 = TwitterAPIv1(session: session)
        v2 = TwitterAPIv2(session: session)
    }

    /// Convenience initializer for OAuth 1.0a authentication.
    /// - Parameters:
    ///   - consumerKey: The application's consumer key.
    ///   - consumerSecret: The application's consumer secret.
    ///   - oauthToken: The user's OAuth token.
    ///   - oauthTokenSecret: The user's OAuth token secret.
    public convenience init(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String,
        oauthTokenSecret: String
    ) {
        self.init(
            .oauth10a(
                .init(
                    consumerKey: consumerKey,
                    consumerSecret: consumerSecret,
                    oauthToken: oauthToken,
                    oauthTokenSecret: oauthTokenSecret
                )
            ),
            environment: .init()
        )
    }

    deinit {
        // De-init Logic Here
    }
}

// MARK: - Refresh OAuth2.0 token

/// Extension providing OAuth 2.0 token refresh functionality.
public extension TwitterAPIClient {
    /// Type alias for the result of a token refresh operation.
    typealias RefreshOAuth20TokenResultValue = (token: TwitterAuthenticationMethod.OAuth20, refreshed: Bool)

    /// Refreshes the OAuth 2.0 access token if necessary.
    /// - Parameters:
    ///   - type: The type of OAuth 2.0 client to use for token refresh.
    ///   - forceRefresh: Whether to force a token refresh even if the current token is still valid.
    ///   - block: Completion handler called with the result of the token refresh.
    func refreshOAuth20Token(
        type: TwitterAuthenticationMethod.OAuth20WithPKCEClientType,
        forceRefresh: Bool = false,
        _ block: @escaping (Result<RefreshOAuth20TokenResultValue, TwitterAPIKitError>) -> Void
    ) {
        guard let (refreshToken, token) = handleBlockGuards(forceRefresh: forceRefresh, block) else {
            return
        }

        let refreshOAuth20TokenClient = TwitterAPIClient(
            .requestOAuth20WithPKCE(type),
            configuration: session.session.configuration,
            environment: session.environment
        )
        self.refreshOAuth20TokenClient = refreshOAuth20TokenClient
        refreshOAuth20TokenClient.auth.oauth20.postOAuth2RefreshToken(
            .init(refreshToken: refreshToken, clientID: token.clientID)
        )
        .responseObject { [weak self] response in
            guard let self else { return }
            switch response.result {
            case let .success(refreshedToken):
                var token = token
                token.refresh(token: refreshedToken)
                session.refreshOAuth20Token(token)
                block(.success((token: token, refreshed: true)))
                NotificationCenter.default.post(
                    name: TwitterAPIClient.didRefreshOAuth20Token,
                    object: self,
                    userInfo: [TwitterAPIClient.tokenUserInfoKey: token]
                )
            case let .failure(error):
                block(.failure(error))
            }
            self.refreshOAuth20TokenClient = nil
        }
    }

    /// Handles Block Guards for `refreshOAuth20Token`
    func handleBlockGuards(
        forceRefresh: Bool = false,
        _ block: @escaping (Result<RefreshOAuth20TokenResultValue, TwitterAPIKitError>) -> Void
    ) -> (String, TwitterAuthenticationMethod.OAuth20)? {
        guard case let .oauth20(token) = apiAuth else {
            block(.failure(.refreshOAuth20TokenFailed(reason: .invalidAuthenticationMethod(apiAuth))))
            return nil
        }

        guard let refreshToken = token.refreshToken else {
            block(.failure(.refreshOAuth20TokenFailed(reason: .refreshTokenIsMissing)))
            return nil
        }

        if !forceRefresh, !token.expired {
            block(.success((token: token, refreshed: false)))
            return nil
        }

        return (refreshToken, token)
    }
}

/// Base class for Twitter API clients.
/// Provides common functionality and session management for API clients.
open class TwitterAPIBase {
    /// The session used for making API requests.
    public let session: TwitterAPISession

    /// Creates a new TwitterAPIBase instance.
    /// - Parameter session: The session to use for making API requests.
    public init(session: TwitterAPISession) {
        self.session = session
    }

    deinit {
        // De-init Logic Here
    }
}

/// Extension providing notification names and user info keys for OAuth 2.0 token refresh events.
public extension TwitterAPIClient {
    /// Notification posted when an OAuth 2.0 token is refreshed.
    static let didRefreshOAuth20Token = Notification
        .Name(rawValue: "TwitterAPIKit.TwitterAPIClient.Notification.didRefreshOAuth20Token")

    /// User info key for accessing the refreshed token in the notification.
    static let tokenUserInfoKey = "TwitterAPIKit.TwitterAPIClient.UserInfoKey.tokenUser"
}
