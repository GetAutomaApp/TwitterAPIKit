import TwitterAPIKit
import XCTest

internal class PostDirectMessagesIndicateTypingRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostDirectMessagesIndicateTypingRequestV1(
            recipientID: "234"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.path, "/1.1/direct_messages/indicate_typing.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, ["recipient_id": "234"])
    }

    deinit {
        // De-init Logic Here
    }
}
