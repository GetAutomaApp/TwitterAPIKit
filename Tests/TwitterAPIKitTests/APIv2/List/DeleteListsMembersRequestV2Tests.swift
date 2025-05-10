import TwitterAPIKit
import XCTest

internal class DeleteListsMembersRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteListsMembersRequestV2(
            id: "_id_",
            userID: "_userID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/lists/_id_/members/_userID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}