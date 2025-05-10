import TwitterAPIKit
import XCTest

internal class PostRetweetRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostRetweetRequestV1(
            id: "_i_",
            trimUser: true
        )

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/statuses/retweet/_i_.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "trim_user": true,
            ]
        )
    }

    public func testDefaultArg() throws {
        let req = PostRetweetRequestV1(
            id: "_i_"
        )

        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
