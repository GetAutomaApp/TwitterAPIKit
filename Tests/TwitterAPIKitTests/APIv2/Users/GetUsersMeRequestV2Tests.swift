import TwitterAPIKit
import XCTest

internal class GetUsersMeRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersMeRequestV2(
            expansions: [.pinnedTweetID],
            tweetFields: [.geo],
            userFields: [.id]
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/me")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "expansions": "pinned_tweet_id",
                "tweet.fields": "geo",
                "user.fields": "id",
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetUsersMeRequestV2()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
