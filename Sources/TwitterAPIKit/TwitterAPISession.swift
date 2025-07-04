// TwitterAPISession.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Crypto
import Foundation

public enum AuthenticationType: Codable, Sendable {
    case oauth10a(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String?,
        oauthTokenSecret: String?
    )
    case oauth20(
        clientId: String,
        clientSecret: String,
        accessToken: String,
        refreshToken: String?
    )
}

/// Class to Run Authenticated Twitter Requests
public final class TwitterAPISession {
    /// Which environment to use
    public let environment: TwitterAPIEnvironment

    private let session: URLSession
    private let authenticationType: AuthenticationType

    /// Initialize TwitterAPI Session
    public init(
        authenticationType: AuthenticationType,
        environment: TwitterAPIEnvironment = .init(),
        session: URLSession = .shared
    ) {
        self.authenticationType = authenticationType
        self.environment = environment
        self.session = session
    }

    /// Sends a request & handles Authentication
    public func send<T: TwitterAPIRequest>(_ request: T) async throws -> T.Response {
        var urlRequest = try request.buildRequest(environment: environment)

        setAuthHeaderValue(request: &urlRequest, twitterRequest: request)

        if request.bodyContentType == .json {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await session.data(for: urlRequest)

        do {
            if let httpResponse = response as? HTTPURLResponse,
               !(200 ... 299).contains(httpResponse.statusCode)
            {
                let errorResponse = try JSONDecoder().decode(TwitterAPIError.self, from: data)
                throw errorResponse
            }

            if T.Response.self == TwitterOAuthTokenV1.self {
                if let token = TwitterOAuthTokenV1(queryStringData: data) {
                    // swiftlint:disable:next force_cast
                    return token as! T.Response
                }
            } else if T.Response.self == TwitterOAuthAccessTokenV1.self {
                if let token = TwitterOAuthAccessTokenV1(queryStringData: data) {
                    // swiftlint:disable:next force_cast
                    return token as! T.Response
                }
            }

            return try JSONDecoder().decode(T.Response.self, from: data)
        } catch let error as TwitterAPIError {
            throw error
        } catch {
            print("Raw response: \(String(describing: String(data: data, encoding: .utf8)))")
            throw error
        }
    }

    private func setAuthHeaderValue(request: inout URLRequest, twitterRequest: any TwitterAPIRequest) {
        switch authenticationType {
        case let .oauth10a(consumerKey, consumerSecret, oauthToken, oauthTokenSecret):
            // For request token, we only need consumer credentials
            let authHeader = authorizationHeader(
                for: twitterRequest.method,
                url: twitterRequest.requestURL(for: environment),
                parameters: twitterRequest.parameterForOAuth,
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: oauthToken,
                oauthTokenSecret: oauthTokenSecret
            )
            request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        case let .oauth20(_, _, accessToken, _):
            let authHeader = "Bearer \(accessToken)"
            print(authHeader)
            request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        }
    }

    deinit {
        // De-init Logic
    }
}
