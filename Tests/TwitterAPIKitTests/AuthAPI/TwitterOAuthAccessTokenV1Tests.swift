import TwitterAPIKit
import XCTest

internal class TwitterOAuthAccessTokenV1Tests: XCTestCase {
    public func test() throws {
        let token = TwitterOAuthAccessTokenV1(
            oauthToken: "token", oauthTokenSecret: "secret", userID: "uid", screenName: "sn"
        )
        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertEqual(token.userID, "uid")
        XCTAssertEqual(token.screenName, "sn")
    }

    public func testQueryStringData() throws {
        let data = Data(
            "oauth_token=token&oauth_token_secret=secret&user_id=uid&screen_name=name".utf8
        )

        guard let token = TwitterOAuthAccessTokenV1(queryStringData: data) else {
            XCTFail("Failed to decode token Response")
        }

        XCTAssertEqual(token.oauthToken, "token")
        XCTAssertEqual(token.oauthTokenSecret, "secret")
        XCTAssertEqual(token.userID, "uid")
        XCTAssertEqual(token.screenName, "name")
    }

    public func testNil() throws {
        let data = Data("".utf8)
        XCTAssertNil(TwitterOAuthAccessTokenV1(queryStringData: data))
    }

    deinit {
        // De-init Logic Here
    }
}
