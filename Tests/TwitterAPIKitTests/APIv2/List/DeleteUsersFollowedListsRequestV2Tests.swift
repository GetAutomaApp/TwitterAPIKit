import TwitterAPIKit
import XCTest

internal class DeleteUsersFollowedListsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersFollowedListsRequestV2(
            id: "_id_",
            listID: "_listID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/followed_lists/_listID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
