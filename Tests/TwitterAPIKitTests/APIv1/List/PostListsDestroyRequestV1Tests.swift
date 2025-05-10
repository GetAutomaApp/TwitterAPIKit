import TwitterAPIKit
import XCTest

internal class PostListsDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostListsDestroyRequestV1(
            list: .listID("lid")
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/destroy.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
            ]
        )
    }

    public func testSlug() throws {
        let req = PostListsDestroyRequestV1(
            list: .slug(slug: "sl", owner: .screenName("sname"))
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "sname",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
