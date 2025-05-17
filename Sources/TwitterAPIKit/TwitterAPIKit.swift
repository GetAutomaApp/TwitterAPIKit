// TwitterAPIKit.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
    @_exported import FoundationNetworking
#endif

/// Specifies the type of Twitter API base URL to use.
public enum TwitterBaseURLType {
    /// The main Twitter API endpoint (api.twitter.com).
    case api
    
    /// The Twitter web endpoint (twitter.com).
    case twitter
    
    /// The Twitter media upload endpoint (upload.twitter.com).
    case upload
}

/// Configuration for Twitter API endpoints.
/// This struct defines the base URLs used for different Twitter API services.
public struct TwitterAPIEnvironment {
    /// The base URL for Twitter web services.
    /// Default: "https://twitter.com"
    public let twitterURL: URL
    
    /// The base URL for Twitter API services.
    /// Default: "https://api.twitter.com"
    public let apiURL: URL
    
    /// The base URL for Twitter media upload services.
    /// Default: "https://upload.twitter.com"
    public let uploadURL: URL

    // swiftlint:disable force_unwrapping
    /// Creates a new Twitter API environment configuration.
    /// - Parameters:
    ///   - twitterURL: The base URL for Twitter web services. Defaults to "https://twitter.com".
    ///   - apiURL: The base URL for Twitter API services. Defaults to "https://api.twitter.com".
    ///   - uploadURL: The base URL for Twitter media upload services. Defaults to "https://upload.twitter.com".
    public init(
        twitterURL: URL = URL(string: "https://twitter.com")!,
        apiURL: URL = URL(string: "https://api.twitter.com")!,
        uploadURL: URL = URL(string: "https://upload.twitter.com")!
    ) {
        self.twitterURL = twitterURL
        self.apiURL = apiURL
        self.uploadURL = uploadURL
    }
    // swiftlint:disable force_unwrapping
}
