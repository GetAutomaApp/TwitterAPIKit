import TwitterAPIKit
import XCTest

internal class GetListsShowRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetListsShowRequestV1(
            list: .listID("lid")
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/lists/show.json")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(
            req.parameters,
            [
                "list_id": "lid",
            ]
        )
    }

    public func testSlugUserID() throws {
        let req = GetListsShowRequestV1(
            list: .slug(slug: "sl", owner: .userID("uid"))
        )
        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_id": "uid",
            ]
        )
    }

    public func testSlugScreenName() throws {
        let req = GetListsShowRequestV1(
            list: .slug(slug: "sl", owner: .screenName("sname"))
        )
        AssertEqualAnyDict(
            req.parameters,
            [
                "slug": "sl",
                "owner_screen_name": "sname",
            ]
        )
    }

    deinit {
        // De-init Logic Here
    }
}
