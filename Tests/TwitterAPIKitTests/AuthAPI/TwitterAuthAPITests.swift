// TwitterAuthAPITests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class TwitterAuthAPITests: XCTestCase {
    public var client: TwitterAuthAPI!

    override public func setUpWithError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        client =
            TwitterAPIClient(
                .oauth10a(.init(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: "")),
                configuration: config
            ).auth
    }

    override public func tearDownWithError() throws {
        MockURLProtocol.cleanup()
    }

    public func testMakeOAuthAuthorizeURL() throws {
        let url = client.oauth10a.makeOAuthAuthorizeURL(
            .init(oauthToken: "token", forceLogin: true, screenName: "name")
        )
        XCTAssertEqual(
            url?.absoluteString,
            "https://api.twitter.com/oauth/authorize?force_login=true&oauth_token=token&screen_name=name"
        )
    }

    public func testMakeOAuthAuthenticateURL() throws {
        let url = client.oauth10a.makeOAuthAuthenticateURL(
            .init(oauthToken: "token", forceLogin: true, screenName: "name")
        )
        XCTAssertEqual(
            url?.absoluteString,
            "https://api.twitter.com/oauth/authenticate?force_login=true&oauth_token=token&screen_name=name"
        )
    }

    public func testMakeOAuth2AuthorizeURL() throws {
        let url = client.oauth20.makeOAuth2AuthorizeURL(
            .init(
                clientID: "cid",
                redirectURI: "callback",
                state: "state",
                codeChallenge: "challenge",
                codeChallengeMethod: "plain",
                scopes: [
                    "users.read", "tweet.read",
                ]
            )
        )

        XCTAssertEqual(
            url?.absoluteString,
            "https://twitter.com/i/oauth2/authorize?client_id=cid&code_challenge=challenge&" +
                "code_challenge_method=plain&redirect_uri=callback&response_type=code&" +
                "scope=users.read%20tweet.read&state=state"
        )
    }

}
