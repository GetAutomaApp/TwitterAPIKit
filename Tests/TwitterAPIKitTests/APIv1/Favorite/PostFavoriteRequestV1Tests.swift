import TwitterAPIKit
import XCTest

internal class PostFavoriteRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostFavoriteRequestV1(
            id: "_i_",
            includeEntities: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/favorites/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
                "include_entities": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostFavoriteRequestV1(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "id": "_i_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
