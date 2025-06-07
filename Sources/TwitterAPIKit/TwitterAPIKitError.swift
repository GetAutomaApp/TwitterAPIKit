// TwitterAPIKitError.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents errors that can occur while using the Twitter API Kit.
public enum TwitterAPIKitError: Error {
    /// Represents specific reasons why a request might fail.
    public enum RequestFailureReason : Sendable{
        /// Indicates that a string could not be encoded to data.
        case cannotEncodeStringToData(string: String)

        /// Indicates that a parameter was invalid with details about why.
        case invalidParameter(parameter: [String: String], cause: String)

        /// Indicates that the provided URL was invalid.
        case invalidURL(url: String)

        /// Indicates that JSON serialization failed for an object.
        case jsonSerializationFailed(obj: String)
    }

    /// Represents specific reasons why a response might fail.
    public enum ResponseFailureReason : Sendable{
        /// Indicates that the response was invalid.
        case invalidResponse(error: Error?)

        /// Indicates that the response status code was unacceptable.
        case unacceptableStatusCode(statusCode: Int, error: TwitterAPIErrorResponse, rateLimit: TwitterRateLimit?)
    }

    /// Represents specific reasons why response serialization might fail.
    public enum ResponseSerializationFailureReason : Sendable{
        /// Indicates that data could not be converted to the expected type.
        case cannotConvert(data: Data, toTypeName: String)

        /// Indicates that JSON decoding failed.
        case jsonDecodeFailed(error: Error)

        /// Indicates that JSON serialization failed.
        case jsonSerializationFailed(error: Error)
    }

    /// Represents specific reasons why OAuth 2.0 token refresh might fail.
    public enum RefreshOAuth20TokenFailureReason : Sendable {
        /// Indicates that the authentication method was invalid.
        case invalidAuthenticationMethod(TwitterAuthenticationMethod)

        /// Indicates that the refresh token is missing.
        case refreshTokenIsMissing
    }

    /// Represents specific reasons why media upload might fail.
    public enum UploadMediaFailureReason : Sendable{
        /// Indicates that media processing failed.
        case processingFailed(error: UploadMediaError)
    }

    case refreshOAuth20TokenFailed(reason: RefreshOAuth20TokenFailureReason)
    case requestFailed(reason: RequestFailureReason)
    case responseFailed(reason: ResponseFailureReason)
    case responseSerializeFailed(reason: ResponseSerializationFailureReason)
    case unkonwn(error: Error)
    case uploadMediaFailed(reason: UploadMediaFailureReason)

    /// Initializes a TwitterAPIKitError from a generic Error.
    /// - Parameter error: The error to convert to TwitterAPIKitError.
    public init(error: Error) {
        if let error = error as? Self {
            self = error
        } else {
            self = .unkonwn(error: error)
        }
    }
}

public extension TwitterAPIKitError {
    /// Indicates whether the error is a request failure.
    var isRequestFailed: Bool {
        if case .requestFailed = self { return true }
        return false
    }

    /// Indicates whether the error is a response failure.
    var isResponseFailed: Bool {
        if case .responseFailed = self { return true }
        return false
    }

    /// Indicates whether the error is a response serialization failure.
    var isResponseSerializeFailed: Bool {
        if case .responseSerializeFailed = self { return true }
        return false
    }

    /// Indicates whether the error is a media upload failure.
    var isUploadMediaFailed: Bool {
        if case .uploadMediaFailed = self { return true }
        return false
    }

    /// Indicates whether the error is an OAuth 2.0 token refresh failure.
    var isRefreshOAuth20TokenFailed: Bool {
        if case .refreshOAuth20TokenFailed = self { return true }
        return false
    }

    /// Indicates whether the error is unknown.
    var isUnkonwn: Bool {
        if case .unkonwn = self { return true }
        return false
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case let .requestFailed(reason):
            reason.underlyingError
        case let .responseFailed(reason):
            reason.underlyingError
        case let .responseSerializeFailed(reason):
            reason.underlyingError
        case let .uploadMediaFailed(reason):
            reason.underlyingError
        case let .refreshOAuth20TokenFailed(reason):
            reason.underlyingError
        case let .unkonwn(error):
            error
        }
    }

    /// Indicates whether the error was due to request cancellation.
    var isCancelled: Bool {
        guard let error = underlyingError as? URLError else {
            return false
        }
        return error.code == .cancelled
    }
}

public extension TwitterAPIKitError {
    /// Represents an error that occurred during media upload.
    struct UploadMediaError: Decodable, Error {
        /// The error code returned by the Twitter API.
        public let code: Int

        /// The name of the error.
        public let name: String

        /// A detailed message describing the error.
        public let message: String

        /// Initializes a new UploadMediaError.
        /// - Parameters:
        ///   - code: The error code
        ///   - name: The error name
        ///   - message: The error message
        public init(code: Int, name: String, message: String) {
            self.code = code
            self.name = name
            self.message = message
        }
    }
}

extension TwitterAPIKitError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .requestFailed(reason):
            reason.localizedDescription
        case let .responseFailed(reason):
            reason.localizedDescription
        case let .responseSerializeFailed(reason):
            reason.localizedDescription
        case let .uploadMediaFailed(reason):
            reason.localizedDescription
        case let .refreshOAuth20TokenFailed(reason):
            reason.localizedDescription
        case let .unkonwn(error):
            error.localizedDescription
        }
    }
}

extension TwitterAPIKitError.UploadMediaError: LocalizedError {
    /// A localized description of the error.
    public var errorDescription: String? {
        "\(name)[code:\(code)]: \(message)"
    }
}

public extension TwitterAPIKitError.RequestFailureReason {
    /// A localized description of the request failure reason.
    var localizedDescription: String {
        switch self {
        case let .invalidURL(url):
            "URL is not valid: \(url)"
        case let .invalidParameter(parameter, cause):
            "Parameter is not valid: \(parameter), cause: \(cause)"
        case let .cannotEncodeStringToData(string):
            "Could not encode \"\(string)\""
        case let .jsonSerializationFailed(obj):
            "JSON could not be serialized. May be invalid object \(String(describing: obj))"
        }
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case .invalidURL,
             .invalidParameter,
             .cannotEncodeStringToData,
             .jsonSerializationFailed:
            nil
        }
    }
}

public extension TwitterAPIKitError.ResponseFailureReason {
    /// A localized description of the response failure reason.
    var localizedDescription: String {
        switch self {
        case let .invalidResponse(error: error):
            if let error {
                return "Response is invalid: \(error.localizedDescription)"
            }
            return "Response is invalid"
        case let .unacceptableStatusCode(statusCode, error: error, rateLimit: _):
            return "Response status code was unacceptable: \(statusCode) with message: \(error.message)"
        }
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case let .invalidResponse(error: error):
            error
        case .unacceptableStatusCode:
            nil
        }
    }

    /// The status code in the case of unacceptableStatusCode.
    var statusCode: Int? {
        if case .unacceptableStatusCode(statusCode: let statusCode, error: _, rateLimit: _) = self {
            return statusCode
        }
        return nil
    }

    /// The rate limit in the case of unacceptableStatusCode.
    var rateLimit: TwitterRateLimit? {
        if case .unacceptableStatusCode(statusCode: _, error: _, rateLimit: let rateLimit) = self {
            return rateLimit
        }
        return nil
    }
}

public extension TwitterAPIKitError.ResponseSerializationFailureReason {
    /// A localized description of the response serialization failure reason.
    var localizedDescription: String {
        switch self {
        case let .jsonSerializationFailed(error):
            "Response could not be serialized because of error:\n\(error.localizedDescription)"
        case let .jsonDecodeFailed(error):
            "Response could not be decoded because of error:\n\(error.localizedDescription)"
        case .cannotConvert(data: _, let toTypeName):
            "Response could not convert to \"\(toTypeName)\""
        }
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case let .jsonSerializationFailed(error: error),
             let .jsonDecodeFailed(error: error):
            error
        case .cannotConvert:
            nil
        }
    }
}

public extension TwitterAPIKitError.UploadMediaFailureReason {
    /// A localized description of the upload media failure reason.
    var localizedDescription: String {
        switch self {
        case let .processingFailed(error):
            error.message
        }
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case let .processingFailed(error: error):
            error
        }
    }
}

public extension TwitterAPIKitError.RefreshOAuth20TokenFailureReason {
    /// A localized description of the refresh OAuth 2.0 token failure reason.
    var localizedDescription: String {
        switch self {
        case let .invalidAuthenticationMethod(method):
            """
            Token refresh is possible only when TwitterAuthenticationMethod is .oauth20. \
            You are currently \(method).
            """
        case .refreshTokenIsMissing:
            "Refresh token is missing."
        }
    }

    /// The underlying error if one exists.
    var underlyingError: Error? {
        switch self {
        case .invalidAuthenticationMethod, .refreshTokenIsMissing:
            nil
        }
    }
}

public extension TwitterAPIKitError {
    /// Returns the request failure reason if this error represents a request failure.
    /// - Returns: The `RequestFailureReason` if present, nil otherwise.
    var requestFailureReason: RequestFailureReason? {
        guard case let .requestFailed(reason: reason) = self else { return nil }
        return reason
    }

    /// Returns the response failure reason if this error represents a response failure.
    /// - Returns: The `ResponseFailureReason` if present, nil otherwise.
    var responseFailureReason: ResponseFailureReason? {
        guard case let .responseFailed(reason) = self else { return nil }
        return reason
    }

    /// Returns the response serialization failure reason if this error represents a serialization failure.
    /// - Returns: The `ResponseSerializationFailureReason` if present, nil otherwise.
    var responseSerializationFailureReason: ResponseSerializationFailureReason? {
        guard case let .responseSerializeFailed(reason) = self else { return nil }
        return reason
    }

    /// Returns the OAuth 2.0 token refresh failure reason if this error represents a token refresh failure.
    /// - Returns: The `RefreshOAuth20TokenFailureReason` if present, nil otherwise.
    var refreshOAuth20TokenFailureReason: RefreshOAuth20TokenFailureReason? {
        guard case let .refreshOAuth20TokenFailed(reason) = self else { return nil }
        return reason
    }

    /// Returns the upload media failure reason if this error represents a media upload failure.
    /// - Returns: The `UploadMediaFailureReason` if present, nil otherwise.
    var uploadMediaFailureReason: UploadMediaFailureReason? {
        guard case let .uploadMediaFailed(reason) = self else { return nil }
        return reason
    }
}
