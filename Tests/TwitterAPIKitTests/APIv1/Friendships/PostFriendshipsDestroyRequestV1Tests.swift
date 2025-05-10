import TwitterAPIKit
import XCTest

internal class PostFriendshipsDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostFriendshipsDestroyRequestV1(
            user: .userID("uid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/friendships/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = PostFriendshipsDestroyRequestV1(
            user: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
