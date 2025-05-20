// TwitterAPISession.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// A session class that handles Twitter API requests and authentication.
/// This class manages the authentication state, network requests, and environment configuration.
open class TwitterAPISession {
    /// The current authentication method being used for API requests.
    /// This property can be read publicly but only modified internally.
    public private(set) var auth: TwitterAuthenticationMethod

    /// The URLSession instance used for making network requests.
    public let session: URLSession

    /// The Twitter API environment configuration (e.g., API endpoints, version).
    public let environment: TwitterAPIEnvironment

    internal let sessionDelegate = TwitterAPISessionDelegate()

    /// Creates a new TwitterAPISession instance.
    /// - Parameters:
    ///   - auth: The authentication method to use for API requests.
    ///   - configuration: The URLSession configuration to use for network requests.
    ///   - environment: The Twitter API environment configuration.
    public init(
        auth: TwitterAuthenticationMethod,
        configuration: URLSessionConfiguration,
        environment: TwitterAPIEnvironment
    ) {
        self.auth = auth
        session = URLSession(configuration: configuration, delegate: sessionDelegate, delegateQueue: nil)
        self.environment = environment
    }

    deinit {
        session.invalidateAndCancel()
    }

    /// Sends a Twitter API request and returns a JSON task.
    /// - Parameter request: The Twitter API request to send.
    /// - Returns: A task that will return JSON data when completed.
    public func send(_ request: TwitterAPIRequest) -> TwitterAPISessionJSONTask {
        do {
            let urlRequest: URLRequest = try tryBuildURLRequest(request)
            let task = session.dataTask(with: urlRequest)
            return sessionDelegate.appendAndResume(task: task)
        } catch {
            return TwitterAPIFailedTask(.init(error: error))
        }
    }

    /// Sends a streaming Twitter API request.
    /// - Parameter streamRequest: The Twitter API request to stream.
    /// - Returns: A task that will stream data continuously.
    public func send(streamRequest: TwitterAPIRequest) -> TwitterAPISessionStreamTask {
        do {
            let urlRequest: URLRequest = try tryBuildURLRequest(streamRequest)
            let task = session.dataTask(with: urlRequest)
            return sessionDelegate.appendAndResumeStream(task: task)
        } catch {
            return TwitterAPIFailedTask(.init(error: error))
        }
    }

    private func tryBuildURLRequest(_ request: TwitterAPIRequest) throws -> URLRequest {
        var urlRequest = try request.buildRequest(environment: environment)

        switch auth {
        case let .oauth(
            consumerKey: consumerKey,
            consumerSecret: consumerSecret,
            oauthToken: oauthToken,
            oauthTokenSecret: oauthTokenSecret
        ):
            let authHeader = authorizationHeader(
                for: request.method,
                url: request.requestURL(for: environment),
                parameters: request.parameterForOAuth,
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: oauthToken,
                oauthTokenSecret: oauthTokenSecret
            )
            urlRequest.setValue(authHeader, forHTTPHeaderField: "Authorization")

        case let .oauth10a(oauth10a):
            let authHeader = authorizationHeader(
                for: request.method,
                url: request.requestURL(for: environment),
                parameters: request.parameterForOAuth,
                consumerKey: oauth10a.consumerKey,
                consumerSecret: oauth10a.consumerSecret,
                oauthToken: oauth10a.oauthToken,
                oauthTokenSecret: oauth10a.oauthTokenSecret
            )
            urlRequest.setValue(authHeader, forHTTPHeaderField: "Authorization")

        case let .oauth20(oauth20):
            urlRequest.setValue("Bearer \(oauth20.accessToken)", forHTTPHeaderField: "Authorization")

        case let .requestOAuth20WithPKCE(.confidentialClient(clientID: apiKey, clientSecret: apiSecretKey)),
             let .basic(apiKey: apiKey, apiSecretKey: apiSecretKey):

            let credential = "\(apiKey):\(apiSecretKey)"
            guard let credentialData = credential.data(using: .utf8) else {
                throw TwitterAPIKitError.requestFailed(reason: .cannotEncodeStringToData(string: credential))
            }
            let credentialBase64 = credentialData.base64EncodedString(options: [])
            let basicAuth = "Basic \(credentialBase64)"
            urlRequest.setValue(basicAuth, forHTTPHeaderField: "Authorization")

        case let .bearer(token):
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        case .none, .requestOAuth20WithPKCE(.publicClient): break
        }

        return urlRequest
    }

    internal func refreshOAuth20Token(_ refreshedToken: TwitterAuthenticationMethod.OAuth20) {
        guard case .oauth20 = auth else {
            return
        }
        auth = .oauth20(refreshedToken)
    }
}
