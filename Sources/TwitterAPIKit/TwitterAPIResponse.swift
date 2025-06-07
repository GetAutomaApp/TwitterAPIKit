// TwitterAPIResponse.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// A generic response type that encapsulates the result of a Twitter API request.
public struct TwitterAPIResponse<Success> : Sendable{
    /// The original URL request that was sent to the Twitter API.
    public let request: URLRequest?

    /// The HTTP response received from the Twitter API.
    public let response: HTTPURLResponse?

    /// The raw data received in the response.
    public let data: Data?

    /// The result of the API call, containing either the successful response or an error.
    public let result: Result<Success, TwitterAPIKitError>

    /// Rate limit information returned by the Twitter API.
    public let rateLimit: TwitterRateLimit?

    /// The successful response value if the request succeeded, nil otherwise.
    public var success: Success? { result.success }

    /// The error that occurred during the request, if any.
    public var error: TwitterAPIKitError? { result.error }

    /// A boolean indicating whether the request resulted in an error.
    public var isError: Bool { error != nil }

    /// Creates a new TwitterAPIResponse instance.
    /// - Parameters:
    ///   - request: The original URL request sent to the API.
    ///   - response: The HTTP response received from the API.
    ///   - data: The raw data received in the response.
    ///   - result: The result containing either success or error.
    ///   - rateLimit: Rate limit information from the API.
    public init(
        request: URLRequest?,
        response: HTTPURLResponse?,
        data: Data?,
        result: Result<Success, TwitterAPIKitError>,
        rateLimit: TwitterRateLimit?
    ) {
        self.request = request
        self.response = response
        self.data = data
        self.result = result
        self.rateLimit = rateLimit
    }
}

public extension TwitterAPIResponse {
    /// Transforms the successful result to a new type using the provided transform function.
    /// - Parameter transform: A closure that takes the current success value and returns a new value.
    /// - Returns: A new TwitterAPIResponse with the transformed success type.
    func map<NewSuccess>(_ transform: (Success) -> NewSuccess) -> TwitterAPIResponse<NewSuccess> {
        .init(
            request: request,
            response: response,
            data: data,
            result: result.map(transform),
            rateLimit: rateLimit
        )
    }

    /// Transforms the successful result to a new type using a transform function that can return a Result.
    /// - Parameter transform: A closure that takes the current success value and returns a Result.
    /// - Returns: A new TwitterAPIResponse with the transformed success type.
    func flatMap<NewSuccess>(_ transform: (Success) -> Result<NewSuccess, TwitterAPIKitError>)
        -> TwitterAPIResponse<NewSuccess>
    {
        .init(
            request: request,
            response: response,
            data: data,
            result: result.flatMap(transform),
            rateLimit: rateLimit
        )
    }

    /// Transforms the successful result to a new type using a transform function that can throw errors.
    /// - Parameter transform: A closure that takes the current success value and can throw an error.
    /// - Returns: A new TwitterAPIResponse with the transformed success type.
    func tryMap<NewSuccess>(_ transform: (Success) throws -> NewSuccess) -> TwitterAPIResponse<NewSuccess> {
        let nextResult: Result<NewSuccess, TwitterAPIKitError> = result.flatMap { data in
            let result: Result<NewSuccess, Error> = .init {
                try transform(data)
            }
            return result.mapError { TwitterAPIKitError(error: $0) }
        }
        return .init(
            request: request,
            response: response,
            data: data,
            result: nextResult,
            rateLimit: rateLimit
        )
    }

    /// Transforms the error in the response using the provided transform function.
    /// - Parameter tranform: A closure that takes the current error and returns a new error.
    /// - Returns: A new TwitterAPIResponse with the transformed error.
    func mapError(_ tranform: (TwitterAPIKitError) -> TwitterAPIKitError) -> TwitterAPIResponse {
        .init(
            request: request,
            response: response,
            data: data,
            result: result.mapError(tranform),
            rateLimit: rateLimit
        )
    }
}

public extension TwitterAPIResponse {
    /// Returns a formatted string representation of the API response for debugging purposes.
    /// The string includes:
    /// - Request method and URL
    /// - Request headers (Content-Type, Content-Length)
    /// - Response status code
    /// - Response headers
    /// - Rate limit information
    /// - Response body (prettified if JSON)
    /// - Error description (if any)
    var prettyString: String {
        let body =
            data.map { data in

                // make pretty
                if let json = try? JSONSerialization.jsonObject(with: data, options: []),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                {
                    String(data: jsonData, encoding: .utf8) ?? ""
                } else {
                    String(data: data, encoding: .utf8) ?? "Invalid data"
                }
            } ?? "No data"

        let contentType = "> Content-Type: \(request?.allHTTPHeaderFields?["Content-Type"] ?? "No Content-Type")"
        let contentLength =
            "> Content-Length: \(request?.allHTTPHeaderFields?["Content-Length"] ?? "No Content-Length")"
        let request = "> \(request?.httpMethod?.uppercased() ?? "Unnown Method"): \(request?.url?.description ?? "")"
        let statusCode = "< Status code: \(response?.statusCode ?? 0)"
        let rateLimitStr = "< \(rateLimit.map { String(describing: $0) } ?? "No rate limit")"

        let responseContentType = "< Content-Type: \(response?.allHeaderFields["Content-Type"] ?? "No Content-Type")"
        let responseContentLength =
            "< Content-Length: \(response?.allHeaderFields["Content-Length"] ?? "No Content-Length")"

        switch result {
        case let .failure(error):
            return "-- Request failure --"
                + "\n\(request)"
                + "\n\(contentType)"
                + "\n\(contentLength)"
                + "\n\(statusCode)"
                + "\n\(responseContentType)"
                + "\n\(responseContentLength)"
                + "\n\(rateLimitStr)"
                + "\n\(error.localizedDescription)"
                + "\n<"
                + "\n\(body.isEmpty ? "Empty body" : body.unescapeSlash)"
        case .success:
            return "-- Request success --"
                + "\n\(request)"
                + "\n\(contentType)"
                + "\n\(contentLength)"
                + "\n\(statusCode)"
                + "\n\(responseContentType)"
                + "\n\(responseContentLength)"
                + "\n\(rateLimitStr)"
                + "\n<"
                + "\n\(body.isEmpty ? "Empty body" : body.unescapeSlash)"
        }
    }
}

private extension String {
    var unescapeSlash: String {
        replacingOccurrences(of: #"\/"#, with: #"/"#)
    }

    var unescapingUnicodeCharacters: String {
        #if os(Linux)
            return self
        #else
            let mutableString = NSMutableString(string: self)
            CFStringTransform(mutableString, nil, "Any-Hex/Java" as NSString, true)
            return mutableString as String
        #endif
    }
}
