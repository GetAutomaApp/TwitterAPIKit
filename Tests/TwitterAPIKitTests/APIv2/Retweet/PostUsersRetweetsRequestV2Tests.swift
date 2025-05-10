import TwitterAPIKit
import XCTest

internal class PostUsersRetweetsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostUsersRetweetsRequestV2(
            id: "_id_",
            tweetID: "_tweetID_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/retweets")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "tweet_id": "_tweetID_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
