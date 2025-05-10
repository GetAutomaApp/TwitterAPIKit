import TwitterAPIKit
import XCTest

internal class GetGeoPlaceIDRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetGeoPlaceIDRequestV1(
            placeID: "_p_"
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/geo/id/_p_.json")
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
