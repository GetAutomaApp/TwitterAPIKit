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
        
        // CRITICAL FIX: Use parameterForOAuth which excludes JSON body parameters for API v2
        let authHeader = authorizationHeader(
            for: request.method,
            url: request.requestURL(for: environment),
            parameters: request.parameterForOAuth,
            consumerKey: consumerKey,
            consumerSecret: consumerSecret,
            oauthToken: oauthToken,
            oauthTokenSecret: oauthTokenSecret
        )
        
        print("OAuth Parameters used for signature: \(request.parameterForOAuth)")
        urlRequest.setValue(authHeader, forHTTPHeaderField: "Authorization")
        
        // Set the exact Content-Type header
        if request.bodyContentType == .json {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // Log the equivalent curl command
        let bodyString = urlRequest.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? ""
        print("Equivalent curl command:")
        print("curl --location '\(urlRequest.url?.absoluteString ?? "")' \\")
        print("--header 'Content-Type: \(urlRequest.value(forHTTPHeaderField: "Content-Type") ?? "")' \\")
        print("--header 'Authorization: \(authHeader)' \\")
        if !bodyString.isEmpty {
            print("--data '\(bodyString)'")
        }
        print("")
        
        let (data, response) = try await session.data(for: urlRequest)
        
        do {
            // First try to decode as error response
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                let errorResponse = try JSONDecoder().decode(TwitterAPIError.self, from: data)
                throw errorResponse
            }
            
            // If not an error, decode as expected response
            return try JSONDecoder().decode(T.Response.self, from: data)
        } catch let error as TwitterAPIError {
            throw error
        } catch {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            } else {
                print("Raw response (not UTF-8): \(data)")
            }
            throw error
        }
    }
}

