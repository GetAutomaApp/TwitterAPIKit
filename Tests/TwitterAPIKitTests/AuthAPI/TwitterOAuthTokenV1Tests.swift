import TwitterAPIKit
import XCTest

internal class TwitterOAuthTokenV1Tests: XCTestCase {
    public func test() throws {
        let token = TwitterOAuthTokenV1(oauthToken: "token", oauthTokenSecret: "secret", oauthCallbackConfirmed: true)
        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertTrue(token.oauthCallbackConfirmed!)
    }

    public func testQueryStringData() {
        let data = Data("oauth_token=token&oauth_token_secret=secret&oauth_callback_confirmed=true".utf8)
        let token = TwitterOAuthTokenV1(queryStringData: data)!

        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertTrue(token.oauthCallbackConfirmed!)
    }

    public func testNil() {
        let data = Data("".utf8)
        XCTAssertNil(TwitterOAuthTokenV1(queryStringData: data))
    }

    deinit {
        // De-init Logic Here
    }
}
