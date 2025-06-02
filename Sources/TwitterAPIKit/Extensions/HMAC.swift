// HMAC.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

internal protocol HMAC {
    // Stub Logic for `swiftlint file_name`
}

#if canImport(CommonCrypto)
    import CommonCrypto

    fileprivate extension Data {
        func hmac(key: Data) -> Data {
            // Thanks: https://github.com/jernejstrasner/SwiftCrypto

            let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
            return withUnsafeBytes { bytes -> Data in
                let result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLen)
                defer {
                    result.deallocate()
                }

                key.withUnsafeBytes { body in
                    CCHmac(
                        CCHmacAlgorithm(kCCHmacAlgSHA1),
                        body.baseAddress,
                        key.count,
                        bytes.baseAddress,
                        count,
                        result
                    )
                }

                return Data(bytes: result, count: digestLen)
            }
        }
    }

    /// Creates an HMAC-SHA1 signature for the given message using the provided key
    /// - Parameters:
    ///   - key: The key to use for signing
    ///   - message: The message to sign
    /// - Returns: The HMAC-SHA1 signature as Data
    public func createHMACSHA1(key: Data, message: Data) -> Data {
        message.hmac(key: key)
    }

#elseif canImport(Crypto) // for Linux
    import Crypto

    /// Creates an HMAC-SHA1 signature for the given message using the provided key
    /// - Parameters:
    ///   - key: The key to use for signing
    ///   - message: The message to sign
    /// - Returns: The HMAC-SHA1 signature as Data
    public func createHMACSHA1(key: Data, message: Data) -> Data {
        Data(HMAC<Insecure.SHA1>.authenticationCode(for: message, using: SymmetricKey(data: key)))
    }
#else
    #error("Crypto is not available in this environment.")
#endif
