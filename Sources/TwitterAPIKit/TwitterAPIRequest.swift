// TwitterAPIRequest.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// Represents HTTP methods supported by the Twitter API.
public enum HTTPMethod: String {
    /// DELETE method, typically used for removing resources.
    case delete = "DELETE"
    /// GET method, typically used for retrieving resources.
    case get = "GET"
    /// POST method, typically used for creating new resources.
    case post = "POST"
    /// PUT method, typically used for updating existing resources.
    case put = "PUT"

    /// Indicates whether the method prefers parameters to be sent as query parameters.
    public var prefersQueryParameters: Bool {
        switch self {
        case .get, .delete:
            true
        default:
            false
        }
    }
}

/// Represents the content type of the request body.
public enum BodyContentType: String {
    /// JSON content type with UTF-8 encoding.
    case json = "application/json; charset=UTF-8"

    /// Multipart form data content type, used for file uploads.
    /// Use MultipartFormDataPart as a parameter.
    /// Example: UploadMediaAppendRequestV1.swift
    case multipartFormData = "multipart/form-data"

    /// URL-encoded form data content type.
    case wwwFormUrlEncoded = "application/x-www-form-urlencoded"
}

/// Represents a part of a multipart form data request.
public enum MultipartFormDataPart {
    /// A file upload part containing binary data and metadata.
    case data(name: String, value: Data, filename: String, mimeType: String)

    /// A simple key-value pair where the value is stringified using String(describing:).
    case value(name: String, value: Any)
    /// The name of the form part.
    public var name: String {
        switch self {
        case let .value(name, _):
            name
        case let .data(name, _, _, _):
            name
        }
    }
}

extension MultipartFormDataPart: Equatable {
    public static func == (lhs: MultipartFormDataPart, rhs: MultipartFormDataPart) -> Bool {
        switch (lhs, rhs) {
        case let (.value(name: leftName, value: leftValue), .value(name: rightName, value: rightValue)):
            leftName == rightName
                && type(of: leftValue) == type(of: rightValue)
                && String(describing: leftValue) == String(describing: rightValue)
        case let (
            .data(
                name: leftName,
                value: leftValue,
                filename: leftFilename,
                mimeType: leftMimeType
            ),
            .data(
                name: rightName,
                value: rightValue,
                filename: rightFilename,
                mimeType: rightMimeType
            )
        ):
            leftName == rightName
                && leftValue == rightValue
                && leftFilename == rightFilename
                && leftMimeType == rightMimeType
        default:
            false
        }
    }
}

/// Protocol defining the requirements for a Twitter API request.
public protocol TwitterAPIRequest {
    /// The Response Type From Twitter
    associatedtype Response: Decodable
    /// The HTTP method to be used for the request.
    var method: HTTPMethod { get }

    /// The base URL type for the request (api, upload, etc.).
    var baseURLType: TwitterBaseURLType { get }

    /// The path component of the request URL.
    var path: String { get }

    /// The complete set of parameters for the request.
    var parameters: [String: Any] { get }

    /// Parameters to be included in the URL query string.
    var queryParameters: [String: Any] { get }

    /// Parameters to be included in the request body.
    var bodyParameters: [String: Any] { get }

    /// The content type of the request body.
    var bodyContentType: BodyContentType { get }
}

/// Default implementations for TwitterAPIRequest.
public extension TwitterAPIRequest {
    /// Default base URL type is .api.
    var baseURLType: TwitterBaseURLType {
        .api
    }

    /// Default body content type is .wwwFormUrlEncoded.
    var bodyContentType: BodyContentType {
        .wwwFormUrlEncoded
    }

    /// Default parameters is an empty dictionary.
    var parameters: [String: Any] {
        [:]
    }

    /// Query parameters are derived from parameters if the method prefers query parameters.
    var queryParameters: [String: Any] {
        if method.prefersQueryParameters {
            return parameters
        }
        return [:]
    }

    /// Body parameters are derived from parameters if the method doesn't prefer query parameters.
    var bodyParameters: [String: Any] {
        if !method.prefersQueryParameters {
            return parameters
        }
        return [:]
    }
}

extension Dictionary where Key == String {
    /// Encodes a dictionary
    public var urlEncodedQueryString: String {
        map { "\($0.key.urlEncoded)=\(String(describing: $0.value).urlEncoded)" }
            .joined(separator: "&")
    }
}

// swiftlint:disable function_body_length
public extension TwitterAPIRequest {
    /// Builds a URL request for the given environment.
    /// - Parameters:
    ///   - environment: The environment to build the request for.
    /// - Returns: A URL request.
    func buildRequest(environment: TwitterAPIEnvironment) throws -> URLRequest {
        guard
            var urlComponent = URLComponents(
                url: requestURL(for: environment),
                resolvingAgainstBaseURL: true
            )
        else {
            throw TwitterAPIKitError.requestFailed(reason: .invalidURL(url: ""))
        }
        if !queryParameters.isEmpty {
            urlComponent.percentEncodedQueryItems =
                queryParameters
                    .sorted { first, second in first.key < second.key }
                    .map { .init(name: $0.urlEncoded, value: "\($1)".urlEncoded) }
        }

        guard let url = urlComponent.url else {
            throw TwitterAPIKitError.requestFailed(reason: .invalidURL(url: ""))
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if !bodyParameters.isEmpty {
            switch bodyContentType {
            case .wwwFormUrlEncoded:
                request.setValue(bodyContentType.rawValue, forHTTPHeaderField: "Content-Type")
                let query = bodyParameters.urlEncodedQueryString
                guard let data = query.data(using: .utf8) else {
                    throw TwitterAPIKitError.requestFailed(reason: .cannotEncodeStringToData(string: query))
                }
                request.httpBody = data
            case .multipartFormData:
                guard let parts = Array(bodyParameters.values) as? [MultipartFormDataPart] else {
                    throw TwitterAPIKitError.requestFailed(
                        reason: .invalidParameter(
                            parameter: String(describing: bodyParameters),
                            cause: """
                            Parameter must be specified in `MultipartFormDataPart` \
                            for `BodyContentType.multipartFormData`.
                            """
                        )
                    )
                }

                let boundary = "TwitterAPIKit-\(UUID().uuidString)"
                let contentType = "\(BodyContentType.multipartFormData.rawValue); boundary=\(boundary)"
                request.setValue(contentType, forHTTPHeaderField: "Content-Type")

                request.httpBody = try multipartFormData(
                    boundary: boundary, parts: parts.sorted { $0.name < $1.name }
                )
                request.setValue(
                    String(request.httpBody?.count ?? 0), forHTTPHeaderField: "Content-Length"
                )
            case .json:
                let param = bodyParameters
                guard JSONSerialization.isValidJSONObject(param) else {
                    throw TwitterAPIKitError.requestFailed(
                        reason: .jsonSerializationFailed(obj: String(describing: param))
                    )
                }
                do {
                    request.httpBody = try JSONSerialization.data(
                        withJSONObject: param, options: []
                    )
                    request.setValue(bodyContentType.rawValue, forHTTPHeaderField: "Content-Type")
                } catch {
                    // This path probably won't pass because it is pre-checked with `isValidJSONObject`.
                    throw TwitterAPIKitError.requestFailed(
                        reason: .jsonSerializationFailed(obj: String(describing: param))
                    )
                }
            }
        }
        return request
    }

    /// Returns the URL for the request.
    func requestURL(for environment: TwitterAPIEnvironment) -> URL {
        environment.baseURL(for: baseURLType).appendingPathComponent(path)
    }

    /// Returns the parameters for OAuth.
    var parameterForOAuth: [String: Any] {
        switch bodyContentType {
        case .wwwFormUrlEncoded:
            parameters
        case .json, .multipartFormData:
            // parameter is empty
            [:]
        }
    }

    private func multipartFormData(boundary: String, parts: [MultipartFormDataPart]) throws -> Data {
        // https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#multipartform-data

        var body = Data()

        let boundaryDelimiter = "--\(boundary)"
        let lineBreak = "\r\n"

        for part in parts {
            try body.appendBody(boundaryDelimiter)
            try body.appendBody(lineBreak)

            switch part {
            case let .value(name: name, value: value):
                try body.appendBody("Content-Disposition: form-data; name=\"\(name)\"")
                try body.appendBody(lineBreak)
                try body.appendBody(lineBreak)
                try body.appendBody(String(describing: value))
                try body.appendBody(lineBreak)

            case let .data(name: name, value: value, filename: filename, mimeType: mimeType):
                try body.appendBody(
                    "Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\""
                )
                try body.appendBody(lineBreak)
                if !mimeType.isEmpty {
                    try body.appendBody("Content-Type: \(mimeType)")
                }
                try body.appendBody(lineBreak)
                try body.appendBody(lineBreak)
                body.append(value)
                try body.appendBody(lineBreak)
            }
        }
        try body.appendBody(boundaryDelimiter)
        try body.appendBody("--")
        try body.appendBody(lineBreak)

        return body
    }
}
// swiftlint:enable function_body_length

private extension TwitterAPIEnvironment {
    func baseURL(for type: TwitterBaseURLType) -> URL {
        switch type {
        case .twitter: twitterURL
        case .api: apiURL
        case .upload: uploadURL
        }
    }
}

private extension Data {
    mutating func appendBody(_ string: String) throws {
        if let data = string.data(using: .utf8) {
            append(data)
        } else {
            throw TwitterAPIKitError.requestFailed(reason: .cannotEncodeStringToData(string: string))
        }
    }
}
