import TwitterAPIKit
import XCTest

internal class PostListsSubscribersCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsSubscribersCreateRequestV1(
            list: .listID("lid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/subscribers/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = PostListsSubscribersCreateRequestV1(
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
