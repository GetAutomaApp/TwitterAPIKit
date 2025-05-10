import TwitterAPIKit
import XCTest

internal class PostSavedSearchesDestroyRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostSavedSearchesDestroyRequestV1(
            id: "_i_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/saved_searches/destroy/_i_.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
