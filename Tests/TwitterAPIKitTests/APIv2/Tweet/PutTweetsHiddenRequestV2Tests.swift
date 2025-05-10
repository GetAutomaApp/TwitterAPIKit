import TwitterAPIKit
import XCTest

internal class PutTweetsHiddenRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = PutTweetsHiddenRequestV2(id: "12", hidden: true)
        XCTAssertEqual(req.method, .put)
        XCTAssertEqual(req.path, "/2/tweets/12/hidden")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(req.parameters, ["hidden": true])
    }

    deinit {
        // De-init Logic Here
    }
}
