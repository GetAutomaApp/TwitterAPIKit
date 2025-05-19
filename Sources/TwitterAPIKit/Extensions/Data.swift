// Data.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

extension Data {
    /// Splits the data into chunks using the specified separator
    /// - Parameters:
    ///   - separator: The data to use as a separator
    ///   - omittingEmptySubsequences: Whether to omit empty subsequences
    /// - Returns: An array of data chunks
    public func split(separator: Data, omittingEmptySubsequences: Bool = true) -> [Data] {
        var current = startIndex
        var chunks = [Data]()

        while let range = self[current...].range(of: separator) {
            if !omittingEmptySubsequences {
                chunks.append(self[current ..< range.lowerBound])
            } else if range.lowerBound > current {
                chunks.append(self[current ..< range.lowerBound])
            }

            current = range.upperBound
        }
        if current < endIndex {
            chunks.append(self[current...])
        }
        return chunks
    }

    /// Attempts to serialize the data as JSON
    /// - Returns: A Result containing either the serialized JSON object or an error
    public func serialize() -> Result<Any, TwitterAPIKitError> {
        do {
            let jsonObj = try JSONSerialization.jsonObject(with: self, options: [])
            return .success(jsonObj)
        } catch {
            return .failure(
                .responseSerializeFailed(
                    reason: .jsonSerializationFailed(error: error)
                )
            )
        }
    }

    /// Attempts to decode the data into a specified Decodable type
    /// - Parameters:
    ///   - type: The type to decode into
    ///   - decoder: The JSON decoder to use
    /// - Returns: A Result containing either the decoded object or an error
    public func decode<T: Decodable>(
        _ type: T.Type,
        decoder: JSONDecoder
    ) -> Result<T, TwitterAPIKitError> {
        let result: Result<T, Error> = .init {
            try decoder.decode(type, from: self)
        }
        return result.mapError { error in
            .responseSerializeFailed(
                reason: .jsonDecodeFailed(error: error)
            )
        }
    }
}
