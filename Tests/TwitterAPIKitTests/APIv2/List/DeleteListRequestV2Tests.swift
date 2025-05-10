import TwitterAPIKit
import XCTest

internal class DeleteListRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteListRequestV2(
            id: "_id_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
