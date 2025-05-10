import TwitterAPIKit
import XCTest

internal class DeleteUsersBookmarksRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersBookmarksRequestV2(
            id: "_i_",
            tweetID: "_t_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_i_/bookmarks/_t_")
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
