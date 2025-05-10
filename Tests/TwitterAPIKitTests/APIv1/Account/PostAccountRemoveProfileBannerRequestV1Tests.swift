import TwitterAPIKit
import XCTest

internal class PostAccountRemoveProfileBannerRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = PostAccountRemoveProfileBannerRequestV1()

        XCTAssertEqual(req.method, .post)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/account/remove_profile_banner.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [:]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
