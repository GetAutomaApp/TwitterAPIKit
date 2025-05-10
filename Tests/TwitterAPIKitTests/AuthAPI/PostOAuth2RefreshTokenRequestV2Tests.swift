import TwitterAPIKit
import XCTest

internal class PostOAuth2RefreshTokenRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuth2RefreshTokenRequestV2(
            refreshToken: "_r_",
            grantType: "_g_",
            clientID: "_c_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/oauth2/token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "refresh_token": "_r_",
                "grant_type": "_g_",
                "client_id": "_c_",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostOAuth2RefreshTokenRequestV2(
            refreshToken: "_rt_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "refresh_token": "_rt_",
                "grant_type": "refresh_token",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
