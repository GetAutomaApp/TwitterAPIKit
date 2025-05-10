import TwitterAPIKit
import XCTest

internal class GetTrendsAvailableRequestV1Tests: XCTestCase {
    public func test() throws {
        let req = GetTrendsAvailableRequestV1()

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/1.1/trends/available.json")
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
