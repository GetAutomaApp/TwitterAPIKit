// TwitterOAuth2BearerToken.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

public struct TwitterOAuth2BearerToken {
    public let tokenType: String
    public let accessToken: String

    public init?(jsonData: Data) throws {
        // {"token_type":"bearer","access_token":"ACCESS_TOKEN"}

        let json = try JSONSerialization.jsonObject(with: jsonData, options: [])

        guard let obj = json as? [String: Any],
              let tokenType = obj["token_type"] as? String,
              let accessToken = obj["access_token"] as? String
        else {
            return nil
        }

        self.tokenType = tokenType
        self.accessToken = accessToken
    }
}
