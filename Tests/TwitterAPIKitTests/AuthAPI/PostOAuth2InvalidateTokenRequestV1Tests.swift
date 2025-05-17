// PostOAuth2InvalidateTokenRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import TwitterAPIKit
import XCTest

internal class PostOAuth2InvalidateTokenRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuth2InvalidateTokenRequestV1(
            accessToken: "_a_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth2/invalidate_token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "access_token": "_a_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
