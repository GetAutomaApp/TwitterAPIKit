import TwitterAPIKit
import XCTest

internal class GetOAuthAuthorizeRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetOAuthAuthorizeRequestV1(
            oauthToken: "_o_",
            forceLogin: true,
            screenName: "_s_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth/authorize")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_o_",
                "force_login": true,
                "screen_name": "_s_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetOAuthAuthorizeRequestV1(
            oauthToken: "_o_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_o_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
