// TwitterAPIKitError.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents errors that can occur in the Twitter API Kit.
public enum TwitterAPIKitError: Error {
    case requestFailed(reason: RequestFailureReason)
    case responseFailed(reason: ResponseFailureReason)
    case apiError(TwitterAPIError)
    
    public enum RequestFailureReason: Sendable {
        case invalidURL(url: String)
        case cannotEncodeStringToData(string: String)
        case invalidParameter(parameter: String, cause: String)
        case jsonSerializationFailed(obj: String)
    }
    
    public enum ResponseFailureReason: Sendable {
        case invalidResponse(response: URLResponse)
        case unacceptableStatusCode(statusCode: Int, response: HTTPURLResponse)
        case responseSerializationFailed(reason: String)
    }
}

/// Represents errors returned by the Twitter API.
public struct TwitterAPIError: Error, Decodable {
    public enum ErrorType {
        case rateLimit
        case unauthorized
        case forbidden
        case notFound
        case serverError
        case unknown

        init(from statusCode: Int) {
            switch statusCode {
            case 401:
                self = .unauthorized
            case 403:
                self = .forbidden
            case 404:
                self = .notFound
            case 429:
                self = .rateLimit
            case 500...599:
                self = .serverError
            default:
                self = .unknown
            }
        }
    }
    
    public let title: String
    public let type: String
    public let status: Int
    public let detail: String
    
    public var errorType: ErrorType {
        ErrorType(from: status)
    }
    
    public var localizedDescription: String {
        return "(\(status)) \(title): \(detail) \(errorType)"
    }
}