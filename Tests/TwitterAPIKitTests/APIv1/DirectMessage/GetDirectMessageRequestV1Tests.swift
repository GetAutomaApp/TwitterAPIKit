import TwitterAPIKit
import XCTest

internal class GetDirectMessageRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetDirectMessageRequestV1(id: "dm_id")

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.path, "/1.1/direct_messages/events/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, ["id": "dm_id"])
    }

    deinit {
        // De-init Logic Here
    }
}
