import TwitterAPIKit
import XCTest

internal class GetFriendshipsNoRetweetsIDsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFriendshipsNoRetweetsIDsRequestV1(
            stringifyIDs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/friendships/no_retweets/ids.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "stringify_ids": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetFriendshipsNoRetweetsIDsRequestV1()

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
