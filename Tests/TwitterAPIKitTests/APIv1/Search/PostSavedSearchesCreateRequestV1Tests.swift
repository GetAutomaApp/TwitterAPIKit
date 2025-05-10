import TwitterAPIKit
import XCTest

internal class PostSavedSearchesCreateRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostSavedSearchesCreateRequestV1(
            query: "_q_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/saved_searches/create.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "query": "_q_",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
