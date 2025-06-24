// OAuthHelper.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Crypto
import Foundation

/// Creates an HMAC-SHA1 signature for the given message using the provided key
/// - Parameters:
///   - key: The key to use for signing
///   - message: The message to sign
/// - Returns: The HMAC-SHA1 signature as Data
public func createHMACSHA1(key: Data, message: Data) -> Data {
    Data(HMAC<Insecure.SHA1>.authenticationCode(for: message, using: SymmetricKey(data: key)))
}

private let oauthVersion = "1.0"
private let oauthSignatureMethod = "HMAC-SHA1"

private func generateOAuthSignature(
    method: String,
    url: String,
    params: [String: String],
    consumerSecret: String,
    tokenSecret: String?
) -> String {
    let sortedParams = params.sorted { $0.key < $1.key }

    let paramString = sortedParams
        .map { key, value in
            let encodedKey = key.urlEncoded
            let encodedValue = value.urlEncoded
            return "\(encodedKey)=\(encodedValue)"
        }
        .joined(separator: "&")

    let encodedURL = url.urlEncoded
    let encodedParamString = paramString.urlEncoded
    let signatureBase = "\(method)&\(encodedURL)&\(encodedParamString)"

    let encodedConsumerSecret = consumerSecret.urlEncoded
    let encodedTokenSecret = (tokenSecret ?? "").urlEncoded
    let signingKey = "\(encodedConsumerSecret)&\(encodedTokenSecret)"

    // swiftlint:disable force_unwrapping
    let key = signingKey.data(using: .utf8)!
    let msg = signatureBase.data(using: .utf8)!
    // swiftlint:enable force_unwrapping

    let hmac = HMAC<Insecure.SHA1>
        .authenticationCode(for: msg, using: SymmetricKey(data: key))
    return Data(hmac).base64EncodedString()
}

// swiftlint:disable:next function_parameter_count
internal func authorizationHeader(
    for method: HTTPMethod,
    url: URL,
    parameters: [String: Any],
    consumerKey: String,
    consumerSecret: String,
    oauthToken: String?,
    oauthTokenSecret: String?,
    oauthVersion: String = "1.0",
    oauthSignatureMethod: String = "HMAC-SHA1",
    oauthTimestamp: String? = .none,
    oauthNonce: String? = .none
) -> String {
    // OAuth parameters - EXACTLY like Python
    var oauthParams: [String: String] = [
        "oauth_consumer_key": consumerKey,
        "oauth_nonce": oauthNonce ?? UUID().uuidString,
        "oauth_signature_method": oauthSignatureMethod,
        "oauth_timestamp": oauthTimestamp ?? String(Int(Date().timeIntervalSince1970)),
        "oauth_version": oauthVersion
    ]

    // Only add oauth_token if it's not empty
    if let token = oauthToken, !token.isEmpty {
        oauthParams["oauth_token"] = token
    }

    // Add query parameters to OAuth parameters for signature - EXACTLY like Python
    for (key, value) in parameters {
        oauthParams[key] = String(describing: value)
    }

    // Generate signature
    let signature = generateOAuthSignature(
        method: method.rawValue,
        url: url.absoluteString,
        params: oauthParams,
        consumerSecret: consumerSecret,
        tokenSecret: oauthTokenSecret
    )

    oauthParams["oauth_signature"] = signature

    // Sort parameters alphabetically and create header - EXACTLY like Python
    let sortedParams = oauthParams.sorted { $0.key < $1.key }
    let headerComponents = sortedParams.map { key, value in
        let encodedKey = key.urlEncoded
        let encodedValue = value.urlEncoded
        return "\(encodedKey)=\"\(encodedValue)\""
    }

    return "OAuth " + headerComponents.joined(separator: ", ")
}
