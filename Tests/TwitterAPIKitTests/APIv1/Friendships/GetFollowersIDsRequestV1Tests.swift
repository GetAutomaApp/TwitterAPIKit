import TwitterAPIKit
import XCTest

internal class GetFollowersIDsRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetFollowersIDsRequestV1(
            user: .userID("uid"),
            count: 10,
            cursor: "_c_",
            stringifyIDs: true
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/followers/ids.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
                "count": 10,
                "cursor": "_c_",
                "stringify_ids": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = GetFollowersIDsRequestV1(
            user: .screenName("s")
        )

        AssertEqualAnyDict(
            req.parameters,
            [
                "screen_name": "s",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
