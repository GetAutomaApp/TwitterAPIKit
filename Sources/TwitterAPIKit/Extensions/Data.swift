// Data.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

extension Data {
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
