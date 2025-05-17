// TwitterAuthAPI.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

open class TwitterAuthAPI {
    public let oauth10a: OAuth10aAPI
    public let oauth20: OAuth20API

    public init(session: TwitterAPISession) {
        oauth10a = .init(session: session)
        oauth20 = .init(session: session)
    }

    deinit {
        // De-init Logic Here
    }
}
