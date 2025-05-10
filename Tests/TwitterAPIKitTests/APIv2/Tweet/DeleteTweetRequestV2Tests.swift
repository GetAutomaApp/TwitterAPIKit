import TwitterAPIKit
import XCTest

internal class DeleteTweetRequestV2Tests: XCTestCase {
    public func test() throws {
        let request = DeleteTweetRequestV2(id: "123")
        XCTAssertEqual(request.method, .delete)
        XCTAssertEqual(request.path, "/2/tweets/123")
        XCTAssertEqual(request.bodyContentType, .wwwFormUrlEncoded)
        XCTAssertTrue(request.parameters.isEmpty)
    }

    deinit {
        // De-init Logic Here
    }
}
