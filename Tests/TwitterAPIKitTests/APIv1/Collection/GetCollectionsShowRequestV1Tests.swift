import TwitterAPIKit
import XCTest

internal class GetCollectionsShowRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetCollectionsShowRequestV1(
            id: "_i_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/collections/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
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
