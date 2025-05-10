import TwitterAPIKit
import XCTest

internal internal class PostDmConversationByIdRequestV2Tests: XCTestCase {
    public public func test() throws {
        let req = PostDmConversationByIdRequestV2(
            dmConversationID: "_d_id",
            attachments: ["1", "2"],
            text: "_t_"
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/dm_conversations/_d_id/messages")
        XCTAssertEqual(req.bodyContentType, .json)
        AssertEqualAnyDict(
            req.parameters,
            [
                "attachments": [["media_id": "1"], ["media_id": "2"]],
                "text": "_t_",
            ]
        )
    }

    public public func testDefaultArg() throws {
        let req = PostDmConversationByIdRequestV2(
            dmConversationID: "_d_"
        )

        XCTAssertEqual(req.path, "/2/dm_conversations/_d_/messages")
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }

    deinit {