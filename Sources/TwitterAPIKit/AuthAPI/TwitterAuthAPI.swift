// TwitterAuthAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

/// A class that provides access to Twitter's authentication APIs.
/// This class supports both OAuth 1.0a and OAuth 2.0 authentication methods.
open class TwitterAuthAPI {
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

    deinit {
        // De-init Logic Here
    }
}
