// TwitterAPIErrorResponse.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents error responses from the Twitter API.
/// This enum can handle both v1 and v2 API error formats, as well as unknown error responses.
public enum TwitterAPIErrorResponse: Equatable {
    /// An error response from the Twitter API v1.1.
    case apiVersion1(TwitterAPIErrorResponseV1)

    /// An error response from the Twitter API v2.
    case apiVersion2(TwitterAPIErrorResponseV2)

    /// An unknown error response containing raw data.
    case unknown(Data)

    /// Creates a new TwitterAPIErrorResponse from raw response data.
    /// Attempts to parse the data as either a v1 or v2 error response.
    /// - Parameter data: The raw response data from the Twitter API.
    public init(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            self = .unknown(data)
            return
        }

        if let version1 = TwitterAPIErrorResponseV1(obj: obj) {
            self = .apiVersion1(version1)
        } else if let version2 = TwitterAPIErrorResponseV2(obj: obj) {
            self = .apiVersion2(version2)
        } else {
            self = .unknown(data)
        }
    }
}

public extension TwitterAPIErrorResponse {
    /// The error message from the response.
    /// For v1 errors, this is the first error message.
    /// For v2 errors, this is the detail field.
    /// For unknown errors, this is the raw data as a string.
    var message: String {
        switch self {
        case let .apiVersion1(version1Response):
            version1Response.message
        case let .apiVersion2(version2Response):
            version2Response.detail
        case let .unknown(data):
            String(data: data, encoding: .utf8) ?? "Unknown"
        }
    }

    /// The error code from the response.
    /// Only available for v1 errors.
    var code: Int? {
        if case let .apiVersion1(version1) = self {
            return version1.code
        }
        return nil
    }

    /// Indicates whether this is a v1 error response.
    var isVersion1: Bool {
        version1 != nil
    }

    /// The v1 error response if this is a v1 error, nil otherwise.
    var version1: TwitterAPIErrorResponseV1? {
        if case let .apiVersion1(version1) = self {
            return version1
        }
        return nil
    }

    /// Indicates whether this is a v2 error response.
    var isVersion2: Bool {
        version2 != nil
    }

    /// The v2 error response if this is a v2 error, nil otherwise.
    var version2: TwitterAPIErrorResponseV2? {
        if case let .apiVersion2(version2) = self {
            return version2
        }
        return nil
    }

    /// Indicates whether this is an unknown error response.
    var isUnknown: Bool {
        unknownData != nil
    }

    /// The raw data if this is an unknown error, nil otherwise.
    var unknownData: Data? {
        if case let .unknown(data) = self {
            return data
        }
        return nil
    }
}

/// Represents an error response from the Twitter API v1.1.
/// Format: {"errors":[{"message":"Sorry, that page does not exist","code":34}]}
public struct TwitterAPIErrorResponseV1 {
    /// The first error message in the response.
    public let message: String

    /// The first error code in the response.
    public let code: Int

    /// All errors included in the response.
    public let errors: [Self]

    /// Creates a new TwitterAPIErrorResponseV1.
    /// - Parameters:
    ///   - message: The error message.
    ///   - code: The error code.
    ///   - errors: Additional errors in the response.
    public init(message: String, code: Int, errors: [Self]) {
        self.message = message
        self.code = code
        self.errors = errors
    }

    /// Creates a new TwitterAPIErrorResponseV1 from a dictionary.
    /// - Parameter obj: A dictionary containing the error response data.
    /// - Returns: An initialized error response if the dictionary contains valid data, nil otherwise.
    public init?(obj: [String: Any]) {
        guard let errors = obj["errors"] as? [[String: Any]] else {
            return nil
        }

        let tErrors: [Self] = errors.compactMap { error in
            guard let message = error["message"] as? String, let code = error["code"] as? Int else { return nil }
            return Self(message: message, code: code, errors: [])
        }

        guard !tErrors.isEmpty else {
            return nil
        }

        message = tErrors[0].message
        code = tErrors[0].code
        self.errors = tErrors
    }

    /// Checks if this error response contains a specific error code.
    /// - Parameter code: The error code to check for.
    /// - Returns: true if the error code is present in this response or any nested errors.
    public func contains(code: Int) -> Bool {
        code == self.code || errors.contains { $0.code == code }
    }
}

extension TwitterAPIErrorResponseV1: Equatable {}

/// https://developer.twitter.com/en/support/twitter-api/error-troubleshooting
/// Represents an error response from the Twitter API v2.
/// See: https://developer.twitter.com/en/support/twitter-api/error-troubleshooting
public struct TwitterAPIErrorResponseV2 {
    /// Represents a specific error in a v2 error response.
    public struct Error: Equatable {
        /// The error message.
        public let message: String

        /// Additional parameters associated with the error.
        public let parameters: [String: [String]]

        /// Creates a new Error.
        /// - Parameters:
        ///   - message: The error message.
        ///   - parameters: Additional parameters describing the error.
        public init(message: String, parameters: [String: [String]]) {
            self.message = message
            self.parameters = parameters
        }

        /// Creates a new Error from a dictionary.
        /// - Parameter obj: A dictionary containing the error data.
        public init(obj: [String: Any]) {
            message = obj["message"].map { String(describing: $0) } ?? ""
            parameters = (obj["parameters"] as? [String: [String]]) ?? [:]
        }
    }

    /// The title of the error.
    public let title: String

    /// A detailed description of the error.
    public let detail: String

    /// The type of error.
    public let type: String

    /// Specific errors included in the response.
    public let errors: [Error]

    /// Creates a new TwitterAPIErrorResponseV2.
    /// - Parameters:
    ///   - title: The error title.
    ///   - detail: The detailed error description.
    ///   - type: The error type.
    ///   - errors: Specific errors included in the response.
    public init(
        title: String,
        detail: String,
        type: String,
        errors: [Error]
    ) {
        self.title = title
        self.detail = detail
        self.type = type
        self.errors = errors
    }

    /// Creates a new TwitterAPIErrorResponseV2 from a dictionary.
    /// - Parameter obj: A dictionary containing the error response data.
    /// - Returns: An initialized error response if the dictionary contains valid data, nil otherwise.
    public init?(obj: [String: Any]) {
        guard let title = obj["title"] as? String,
              let detail = obj["detail"] as? String,
              let type = obj["type"] as? String
        else {
            return nil
        }

        self.title = title
        self.detail = detail
        self.type = type
        errors = ((obj["errors"] as? [[String: Any]]) ?? []).map { Error(obj: $0) }
    }
}

extension TwitterAPIErrorResponseV2: Equatable {}
