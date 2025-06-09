// TwitterAPISession.swift
import Foundation
import Crypto

/// A simple Twitter API session for direct key-based login (OAuth 1.0a only).
public final class TwitterAPISession {
    private let consumerKey: String
    private let consumerSecret: String
    private let oauthToken: String
    private let oauthTokenSecret: String
    private let environment: TwitterAPIEnvironment
    private let session: URLSession

    public init(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String,
        oauthTokenSecret: String,
        environment: TwitterAPIEnvironment = TwitterAPIEnvironment(),
        session: URLSession = .shared
    ) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.oauthToken = oauthToken
        self.oauthTokenSecret = oauthTokenSecret
        self.environment = environment
        self.session = session
    }

    public func send<T: TwitterAPIRequest>(_ request: T, authHeaderOverride: String? = nil) async throws -> T.Response {
        var urlRequest = try request.buildRequest(environment: environment)

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

        if request.bodyContentType == .json {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await session.data(for: urlRequest)

        do {
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                let errorResponse = try JSONDecoder().decode(TwitterAPIError.self, from: data)
                throw errorResponse
            }

            return try JSONDecoder().decode(T.Response.self, from: data)
        } catch let error as TwitterAPIError {
            throw error
        } catch {
            print("Other Error")
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            } else {
                print("Raw response (not UTF-8): \(data)")
            }
            throw error
        }
    }
}

