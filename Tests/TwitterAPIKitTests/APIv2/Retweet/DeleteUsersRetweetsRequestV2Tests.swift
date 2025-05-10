import TwitterAPIKit
import XCTest

internal class DeleteUsersRetweetsRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersRetweetsRequestV2(
            id: "_id_",
            sourceTweetID: "_sourceTweetID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/retweets/_sourceTweetID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
