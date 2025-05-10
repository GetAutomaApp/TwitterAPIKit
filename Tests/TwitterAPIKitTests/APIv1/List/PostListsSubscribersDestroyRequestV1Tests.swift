import TwitterAPIKit
import XCTest

internal class PostListsSubscribersDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsSubscribersDestroyRequestV1(
            list: .listID("lid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/subscribers/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = PostListsSubscribersDestroyRequestV1(
            list: .slug(slug: "sl", owner: .screenName("name"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "name",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
