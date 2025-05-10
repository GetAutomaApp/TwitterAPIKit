import TwitterAPIKit
import XCTest

internal class DeleteUsersMutingRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = DeleteUsersMutingRequestV2(
            sourceUserID: "_sourceUserID_",
            targetUserID: "_targetUserID_"
        )

        XCTAssertEqual(req.method, .delete)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/users/_sourceUserID_/muting/_targetUserID_")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
