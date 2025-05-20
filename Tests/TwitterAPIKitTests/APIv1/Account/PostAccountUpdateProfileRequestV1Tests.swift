// PostAccountUpdateProfileRequestV1Tests.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import TwitterAPIKit
import XCTest

internal class PostAccountUpdateProfileRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostAccountUpdateProfileRequestV1(
            url: "_u_",
            name: "_n_",
            location: "_l_",
            skipStatus: true,
            description: "_d_",
            includeEntities: true,
            profileLinkColor: "_p_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/account/update_profile.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "url": "_u_",
                "name": "_n_",
                "location": "_l_",
                "skip_status": true,
                "description": "_d_",
                "include_entities": true,
                "profile_link_color": "_p_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostAccountUpdateProfileRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
