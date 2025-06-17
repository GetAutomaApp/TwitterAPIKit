// OAuthHelper.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation
import Crypto

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
    // Sort parameters alphabetically
    let sortedParams = params.sorted { $0.key < $1.key }

    // Create parameter string - EXACTLY like Python
    let paramString = sortedParams.map { key, value in
        // Use the same encoding as Python's quote function
        let encodedKey = key.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? key
        let encodedValue = value.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? value
        return "\(encodedKey)=\(encodedValue)"
    }.joined(separator: "&")

    // Create signature base string - EXACTLY like Python
    let encodedURL = url.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? url
    let encodedParamString = paramString.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? paramString
    let signatureBase = "\(method)&\(encodedURL)&\(encodedParamString)"

    // Create signing key - EXACTLY like Python
    let encodedConsumerSecret = consumerSecret.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? consumerSecret
    let encodedTokenSecret = (tokenSecret ?? "").addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? ""
    let signingKey = "\(encodedConsumerSecret)&\(encodedTokenSecret)"

    // Generate signature - EXACTLY like Python
    let key = signingKey.data(using: .utf8)!
    let msg = signatureBase.data(using: .utf8)!
    let hmac = HMAC<Insecure.SHA1>.authenticationCode(for: msg, using: SymmetricKey(data: key))
    let signature = Data(hmac).base64EncodedString()

    return signature
}

func authorizationHeader(
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

    if let oauthToken = oauthToken {
        oauthParams["oauth_token"] = oauthToken
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
        let encodedKey = key.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? key
        let encodedValue = value.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~")) ?? value
        return "\(encodedKey)=\"\(encodedValue)\""
    }

    return "OAuth " + headerComponents.joined(separator: ", ")
}