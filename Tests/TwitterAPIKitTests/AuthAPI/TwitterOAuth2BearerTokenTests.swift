import TwitterAPIKit
import XCTest

internal class TwitterOAuth2BearerTokenTests: XCTestCase {
    public func testJsonData() throws {
        let data = Data(#"{"token_type":"bearer","access_token":"token"}"#.utf8)
        let token = try TwitterOAuth2BearerToken(jsonData: data)!

        XCTAssertEqual(token.tokenType, "bearer")
        XCTAssertEqual(token.accessToken, "token")
    }

    public func testNil() throws {
        let data = Data("{}".utf8)
        XCTAssertNil(try TwitterOAuth2BearerToken(jsonData: data))
    }

    public func testThrow() throws {
        let data = Data("".utf8)
        XCTAssertThrowsError(try TwitterOAuth2BearerToken(jsonData: data))
    }

    deinit {
        // De-init Logic Here
    }
}
