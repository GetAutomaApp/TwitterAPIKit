// TwitterAPIKitError.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public enum TwitterAPIKitError: Error {
    case requestFailed(reason: RequestFailureReason)
    public enum RequestFailureReason {
        case invalidURL(url: String)
        case invalidParameter(parameter: [String: Any], cause: String)

        case cannotEncodeStringToData(string: String)
        case jsonSerializationFailed(obj: Any)
    }

    case responseFailed(reason: ResponseFailureReason)
    public enum ResponseFailureReason {
        case invalidResponse(error: Error?)
        case unacceptableStatusCode(statusCode: Int, error: TwitterAPIErrorResponse, rateLimit: TwitterRateLimit?)
    }

    case responseSerializeFailed(reason: ResponseSerializationFailureReason)
    public enum ResponseSerializationFailureReason {
        case jsonSerializationFailed(error: Error)
        case jsonDecodeFailed(error: Error)
        case cannotConvert(data: Data, toTypeName: String)
    }

    case uploadMediaFailed(reason: UploadMediaFailureReason)
    public enum UploadMediaFailureReason {
        case processingFailed(error: UploadMediaError)
    }

    case refreshOAuth20TokenFailed(reason: RefreshOAuth20TokenFailureReason)
    public enum RefreshOAuth20TokenFailureReason {
        case invalidAuthenticationMethod(TwitterAuthenticationMethod)
        case refreshTokenIsMissing
    }

    case unkonwn(error: Error)

    public init(error: Error) {
        if let error = error as? Self {
            self = error
        } else {
            self = .unkonwn(error: error)
        }
    }
}

public extension TwitterAPIKitError {
    var isRequestFailed: Bool {
        if case .requestFailed = self { return true }
        return false
    }

    var isResponseFailed: Bool {
        if case .responseFailed = self { return true }
        return false
    }

    var isResponseSerializeFailed: Bool {
        if case .responseSerializeFailed = self { return true }
        return false
    }

    var isUploadMediaFailed: Bool {
        if case .uploadMediaFailed = self { return true }
        return false
    }

    var isRefreshOAuth20TokenFailed: Bool {
        if case .refreshOAuth20TokenFailed = self { return true }
        return false
    }

    var isUnkonwn: Bool {
        if case .unkonwn = self { return true }
        return false
    }

    var underlyingError: Error? {
        switch self {
        case let .requestFailed(reason):
            return reason.underlyingError
        case let .responseFailed(reason):
            return reason.underlyingError
        case let .responseSerializeFailed(reason):
            return reason.underlyingError
        case let .uploadMediaFailed(reason):
            return reason.underlyingError
        case let .refreshOAuth20TokenFailed(reason):
            return reason.underlyingError
        case let .unkonwn(error):
            return error
        }
    }

    var isCancelled: Bool {
        guard let error = underlyingError as? URLError else {
            return false
        }
        return error.code == .cancelled
    }
}

public extension TwitterAPIKitError {
    struct UploadMediaError: Decodable, Error {
        public let code: Int
        public let name: String
        public let message: String

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
            return reason.localizedDescription
        case let .responseFailed(reason):
            return reason.localizedDescription
        case let .responseSerializeFailed(reason):
            return reason.localizedDescription
        case let .uploadMediaFailed(reason):
            return reason.localizedDescription
        case let .refreshOAuth20TokenFailed(reason):
            return reason.localizedDescription
        case let .unkonwn(error):
            return error.localizedDescription
        }
    }
}

extension TwitterAPIKitError.UploadMediaError: LocalizedError {
    public var errorDescription: String? {
        return "\(name)[code:\(code)]: \(message)"
    }
}

public extension TwitterAPIKitError.RequestFailureReason {
    var localizedDescription: String {
        switch self {
        case let .invalidURL(url):
            return "URL is not valid: \(url)"
        case let .invalidParameter(parameter, cause):
            return "Parameter is not valid: \(parameter), cause: \(cause)"
        case let .cannotEncodeStringToData(string):
            return "Could not encode \"\(string)\""
        case let .jsonSerializationFailed(obj):
            return "JSON could not be serialized. May be invalid object \(String(describing: obj))"
        }
    }

    var underlyingError: Error? {
        switch self {
        case .invalidURL,
             .invalidParameter,
             .cannotEncodeStringToData,
             .jsonSerializationFailed:
            return nil
        }
    }
}

public extension TwitterAPIKitError.ResponseFailureReason {
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

    var underlyingError: Error? {
        switch self {
        case let .invalidResponse(error: error):
            return error
        case .unacceptableStatusCode:
            return nil
        }
    }

    /// A status code in the case of unacceptableStatusCode.
    var statusCode: Int? {
        if case .unacceptableStatusCode(statusCode: let statusCode, error: _, rateLimit: _) = self {
            return statusCode
        }
        return nil
    }

    /// A rate limit in the case of unacceptableStatusCode.
    var rateLimit: TwitterRateLimit? {
        if case .unacceptableStatusCode(statusCode: _, error: _, rateLimit: let rateLimit) = self {
            return rateLimit
        }
        return nil
    }
}

public extension TwitterAPIKitError.ResponseSerializationFailureReason {
    var localizedDescription: String {
        switch self {
        case let .jsonSerializationFailed(error):
            return "Response could not be serialized because of error:\n\(error.localizedDescription)"
        case let .jsonDecodeFailed(error):
            return "Response could not be decoded because of error:\n\(error.localizedDescription)"
        case .cannotConvert(data: _, let toTypeName):
            return "Response could not convert to \"\(toTypeName)\""
        }
    }

    var underlyingError: Error? {
        switch self {
        case let .jsonSerializationFailed(error: error),
             let .jsonDecodeFailed(error: error):
            return error
        case .cannotConvert:
            return nil
        }
    }
}

public extension TwitterAPIKitError.UploadMediaFailureReason {
    var localizedDescription: String {
        switch self {
        case let .processingFailed(error):
            return error.message
        }
    }

    var underlyingError: Error? {
        switch self {
        case let .processingFailed(error: error):
            return error
        }
    }
}

public extension TwitterAPIKitError.RefreshOAuth20TokenFailureReason {
    var localizedDescription: String {
        switch self {
        case let .invalidAuthenticationMethod(method):
            return
                "Token refresh is possible only when TwitterAuthenticationMethod is .oauth20. You are currently \(method)."
        case .refreshTokenIsMissing:
            return "Refresh token is missing."
        }
    }

    var underlyingError: Error? {
        switch self {
        case .invalidAuthenticationMethod, .refreshTokenIsMissing:
            return nil
        }
    }
}

public extension TwitterAPIKitError {
    var requestFailureReason: RequestFailureReason? {
        guard case let .requestFailed(reason: reason) = self else { return nil }
        return reason
    }

    var responseFailureReason: ResponseFailureReason? {
        guard case let .responseFailed(reason) = self else { return nil }
        return reason
    }

    var responseSerializationFailureReason: ResponseSerializationFailureReason? {
        guard case let .responseSerializeFailed(reason) = self else { return nil }
        return reason
    }

    var refreshOAuth20TokenFailureReason: RefreshOAuth20TokenFailureReason? {
        guard case let .refreshOAuth20TokenFailed(reason) = self else { return nil }
        return reason
    }
}
