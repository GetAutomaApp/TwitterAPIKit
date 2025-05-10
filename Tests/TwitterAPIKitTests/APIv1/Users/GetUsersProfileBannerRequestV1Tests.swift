import TwitterAPIKit
import XCTest

internal class GetUsersProfileBannerRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetUsersProfileBannerRequestV1(
            user: .userID("uid")
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/users/profile_banner.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "user_id": "uid",
            ]
        )
    }

    public func testScreenName() throws {
        let req = GetUsersProfileBannerRequestV1(
            user: .screenName("s")
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/users/profile_banner.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
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
