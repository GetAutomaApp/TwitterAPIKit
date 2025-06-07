// TwitterAuthAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

/// A class that provides access to Twitter's authentication APIs.
/// This class supports both OAuth 1.0a and OAuth 2.0 authentication methods.
public struct TwitterAuthAPI: Sendable {
    /// The OAuth 1.0a API client for legacy authentication.
    public let oauth10a: OAuth10aAPI

    /// The OAuth 2.0 API client for modern authentication.
    public let oauth20: OAuth20API

    /// Creates a new TwitterAuthAPI instance.
    /// - Parameter session: The Twitter API session to use for making requests.
    public init(session: TwitterAPISession) {
        oauth10a = .init(session: session)
        oauth20 = .init(session: session)
    }

}
