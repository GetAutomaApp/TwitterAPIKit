import TwitterAPIKit
import XCTest

internal class PostOAuthAccessTokenRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostOAuthAccessTokenRequestV1(
            oauthToken: "_ot_",
            oauthVerifier: "_ov_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/oauth/access_token")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "oauth_token": "_ot_",
                "oauth_verifier": "_ov_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
