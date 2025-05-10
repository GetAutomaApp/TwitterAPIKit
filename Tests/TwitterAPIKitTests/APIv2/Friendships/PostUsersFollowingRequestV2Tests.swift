import TwitterAPIKit
import XCTest

internal class PostUsersFollowingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PostUsersFollowingRequestV2(
            id: "_id_",
            targetUserID: "_targetUserID_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_id_/following")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(req.parameters, ["target_user_id": "_targetUserID_"])
    }

    deinit {
        // De-init Logic Here
    }
}
