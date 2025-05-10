import TwitterAPIKit
import XCTest

internal class GetComplianceJobRequestV2Tests: XCTestCase {
    public func test() throws {
        let req = GetComplianceJobRequestV2(
            id: 1
        )

        XCTAssertEqual(req.method, .get)
        XCTAssertEqual(req.baseURLType, .api)
        XCTAssertEqual(req.path, "/2/compliance/jobs/1")
        XCTAssertEqual(req.bodyContentType, .wwwFormUrlEncoded)
        AssertEqualAnyDict(req.parameters, [:])
    }

    deinit {
        // De-init Logic Here
    }
}
