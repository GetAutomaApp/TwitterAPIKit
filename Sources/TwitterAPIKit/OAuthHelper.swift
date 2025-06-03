// OAuthHelper.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

private let oauthVersion = "1.0"
private let oauthSignatureMethod = "HMAC-SHA1"

// swiftlint:disable function_parameter_count function_body_length
/// Generates an OAuth authorization header for a given HTTP method, URL, and parameters.
/// - Parameters:
///   - method: The HTTP method to use.
///   - url: The URL to use.
///   - parameters: The parameters to use.
///   - consumerKey: The consumer key to use.
///   - consumerSecret: The consumer secret to use.
///   - oauthToken: The OAuth token to use.
///   - oauthTokenSecret: The OAuth token secret to use.
///   - oauthTimestamp: The OAuth timestamp to use.
///   - oauthNonce: The OAuth nonce to use.
/// - Returns: The OAuth authorization header.
public func authorizationHeader(
    for method: HTTPMethod,
    url: URL,
    parameters: [String: Any],
    consumerKey: String,
    consumerSecret: String,
    oauthToken: String?,
    oauthTokenSecret: String?,
    oauthTimestamp: String? = .none,
    oauthNonce: String? = .none
) -> String {
    var authorizationParameters = [String: Any]()
    authorizationParameters["oauth_version"] = oauthVersion
    authorizationParameters["oauth_signature_method"] = oauthSignatureMethod
    authorizationParameters["oauth_consumer_key"] = consumerKey
    authorizationParameters["oauth_timestamp"] = oauthTimestamp ?? String(Int(Date().timeIntervalSince1970))
    authorizationParameters["oauth_nonce"] = oauthNonce ?? UUID().uuidString
    if let oauthToken {
        authorizationParameters["oauth_token"] = oauthToken
    }
    for (key, value) in parameters where key.hasPrefix("oauth_") {
        authorizationParameters.updateValue(value, forKey: key)
    }
    let combinedParameters = authorizationParameters.merging(parameters) { $1 }

    authorizationParameters["oauth_signature"] = oauthSignature(
        for: method,
        url: url,
        parameters: combinedParameters,
        consumerSecret: consumerSecret,
        oauthTokenSecret: oauthTokenSecret
    )

    let authorizationParameterComponents = authorizationParameters
        .urlEncodedQueryString
        .components(separatedBy: "&")
        .sorted()

    var headerComponents = [String]()
    for component in authorizationParameterComponents {
        let subcomponent = component.components(separatedBy: "=")
        if subcomponent.count == 2 {
            headerComponents.append("\(subcomponent[0])=\"\(subcomponent[1])\"")
        }
    }

    return "OAuth " + headerComponents.joined(separator: ", ")
}
// swiftlint:enable function_parameter_count function_body_length

private func oauthSignature(
    for method: HTTPMethod,
    url: URL,
    parameters: [String: Any],
    consumerSecret: String,
    oauthTokenSecret: String?
) -> String {
    let tokenSecret = oauthTokenSecret?.urlEncodedString ?? ""
    let encodedConsumerSecret = consumerSecret.urlEncodedString
    let signingKey = "\(encodedConsumerSecret)&\(tokenSecret)"
    let parameterComponents = parameters.urlEncodedQueryString.components(separatedBy: "&").sorted()
    let parameterString = parameterComponents.joined(separator: "&")
    let encodedParameterString = parameterString.urlEncodedString
    let encodedURL = url.absoluteString.urlEncodedString
    let signatureBaseString = "\(method.rawValue)&\(encodedURL)&\(encodedParameterString)"

    let key = signingKey.data(using: .utf8) ?? Data()
    let msg = signatureBaseString.data(using: .utf8) ?? Data()
    let sha1 = createHMACSHA1(key: key, message: msg)
    return sha1.base64EncodedString(options: [])
}
